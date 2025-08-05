
// MARK: Initialize chart
const ctx = document.getElementById('canvas').getContext('2d');

const chart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: Array.from({ length: 10 }, (_, i) => i + 1), // [1, 2, ..., 10]
    datasets: []
  },
  options: {
    maintainAspectRatio: false,
    responsive: true,
    plugins: {
      title: {
        display: true,
        text: 'WASM Quick Sort Comparison Benchmark',
        font: {
          size: 18
        }
      },
      subtitle: {
        display: true,
        text: [
          'Loading... (page may freeze)',
          'Do not open DevTools and do not minimize browser window for best results.',
        ],
        font: {
          size: 14
        }
      },
      legend: {
        display: true,
        position: 'top'
      }
    },
    scales: {
      x: {
        title: {
          display: true,
          text: 'Measurement Repeat Count'
        },
        min: 1,
        max: 10,
        ticks: {
          stepSize: 1
        }
      },
      y: {
        title: {
          display: true,
          text: 'Median Time (ms)'
        },
        min: 0,
        max: 2000,
        ticks: {
          stepSize: 200
        }
      }
    }
  }
});



// MARK: Sort measurements logic
const numbersJson = await fetch('numbers.json').then(res => res.text());

const avgMeasurementsJS = [];

function qsort(array) {
  var stack = [];

  stack.push({
    start: 0,
    end: array.length - 1,
  });

  while (stack.length > 0) {
    var stackTop = stack.pop();
    var start = stackTop.start;
    var end = stackTop.end;

    // if (start >= end) continue;

    var pivotId = end;
    var pivot = array[pivotId];

    var currSwapId = start;
    for (var i = start; i < end; i++) {
      if (array[i] > pivot) continue;

      var temp = array[i];
      array[i] = array[currSwapId];
      array[currSwapId] = temp;
      currSwapId++;
    }

    array[pivotId] = array[currSwapId];
    array[currSwapId] = pivot;

    if (currSwapId - 1 > start) {
      stack.push({
        start,
        end: currSwapId - 1,
      });
    }

    if (currSwapId + 1 < end) {
      stack.push({
        start: currSwapId + 1,
        end,
      });
    }

  }

  return array;
}

class Measurements {
  static async getMeasurements({
    id,
    repeatTimes,
    fn,
    prepare,
    cleanup,
  }) {
    const measures = [];
    for (let i = -1; i < repeatTimes; i++) {
      const prepareEnv = await prepare({
        id,
      });
      const start = performance.now();
      await fn(...prepareEnv.fnArgs);
      const end = performance.now();
      cleanup && await cleanup({
        ...prepareEnv,
        id,
        start,
        end,
        iteration: i,
      });
      await new Promise(res => setTimeout(res, 0));
      if (i === -1) continue;
      measures.push(end - start);
    }

    return measures;
  }
}

async function getAverageTimeJS(repeatTimes) {
  const measuresJS = await Measurements.getMeasurements({
    id: 'js',
    repeatTimes: 10,
    fn: qsort,
    prepare: () => {
      const numbers = JSON.parse(numbersJson);
      return {
        fnArgs: [numbers],
      }
    },
  });

  measuresJS.sort((a, b) => a - b);

  const timeJS = measuresJS.at(Math.floor(measuresJS.length / 2));

  return timeJS;
}

const repeats = 10;

chart.options.scales.y.title.text = `Median Time of ${repeats} repeats (ms)`;
chart.update();

for (let i = 0; i < 10; i++) {
  const timeJS = await getAverageTimeJS(repeats);

  chart.update();

  avgMeasurementsJS.push(timeJS);

  chart.data.datasets[0] = {
    label: 'JS',
    data: avgMeasurementsJS,
    borderColor: 'green',
    fill: false
  }

  if (i === 0) {
    chart.options.scales.y.min = undefined;
    chart.options.scales.y.max = undefined;
    chart.options.scales.y.ticks.stepSize = undefined;
  }

  chart.update();

  console.log('avgMeasurementsJS', avgMeasurementsJS);
}