// MARK: Imports and init
import { qsort as qsortAS, garbageCollect } from "./build/AssemblyScript/release.js";

// MARK: Initialize chart
const ctx = document.getElementById('canvas').getContext('2d');

const chart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: Array.from({ length: 10 }, (_, i) => i + 1),
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
          'Calculating... (page may freeze)',
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

try {
  // MARK: Initialize Emscripten and numbers
  await instantiateEmscripten();

  const qsortC = Module.cwrap('quicksortInt',
    null,
    ['number', 'number', 'number']);

  const numbersJson = await fetch('numbers.json').then(res => res.text());

  // MARK: Sort measurements logic

  function qsortJS(array) {
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
      repeatTimes,
      fn: qsortJS,
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

  async function getAverageTimeAS(repeatTimes) {
    const measuresAS = await Measurements.getMeasurements({
      id: 'as',
      repeatTimes,
      fn: qsortAS,
      prepare: () => {
        const numbersArr = JSON.parse(numbersJson);
        const numbers = new Int32Array(numbersArr);
        return {
          fnArgs: [numbers],
        }
      },
      cleanup: () => {
        garbageCollect();
      }
    });

    measuresAS.sort((a, b) => a - b);

    const time = measuresAS.at(Math.floor(measuresAS.length / 2));

    return time;
  }

  async function getAverageTimeC(repeatTimes) {
    const measures = await Measurements.getMeasurements({
      id: 'c',
      repeatTimes,
      fn: qsortC,
      prepare: () => {
        const numbersArr = JSON.parse(numbersJson);
        const numbers = new Int32Array(numbersArr);

        const pointer = Module._malloc(numbers.length * 4);
        const offset = pointer / 4;
        HEAP32.set(numbers, offset);

        return {
          fnArgs: [pointer, 0, numbers.length - 1],
          pointer,
          numbers,
          offset
        }
      },
      cleanup: ({ pointer, numbers, offset }) => {
        numbers.set(HEAP32.subarray(offset, offset + numbers.length));
        Module._free(pointer);
      },
    });

    measures.sort((a, b) => a - b);

    const time = measures.at(Math.floor(measures.length / 2));

    return time;
  }

  // MARK: Calculations

  const avgMeasurementsJS = [];
  const avgMeasurementsAS = [];
  const avgMeasurementsC = [];

  const repeats = 10;

  chart.options.scales.y.title.text = `Median Time of ${repeats} repeats (ms)`;
  chart.update();

  for (let i = 0; i < 10; i++) {
    const timeJS = await getAverageTimeJS(repeats);
    avgMeasurementsJS.push(timeJS);
    if (i === 0) {
      chart.options.scales.y.min = undefined;
      chart.options.scales.y.max = undefined;
      chart.options.scales.y.ticks.stepSize = undefined;
    }
    chart.data.datasets[0] = {
      label: 'JS',
      data: avgMeasurementsJS,
      borderColor: 'green',
      fill: false
    }
    chart.update();

    const timeAS = await getAverageTimeAS(repeats);
    avgMeasurementsAS.push(timeAS);
    chart.data.datasets[1] = {
      label: 'AssemblyScript',
      data: avgMeasurementsAS,
      borderColor: 'red',
      fill: false
    }
    chart.update();

    const timeC = await getAverageTimeC(repeats);
    avgMeasurementsC.push(timeC);
    chart.data.datasets[2] = {
      label: 'C',
      data: avgMeasurementsC,
      borderColor: 'blue',
      fill: false
    }
    chart.update();
  }

  chart.options.plugins.subtitle.text = 'Finished';
  chart.update();
} catch (err) {
  chart.options.plugins.subtitle.text = 'ERROR. Go to console to view details.';
  chart.options.plugins.subtitle.color = '#ff0000';
  chart.update();
  throw err;
}
