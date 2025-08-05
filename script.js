
const numbersJson = await fetch('numbers.json').then(res => res.text());
// const numbers = await numbersJson.json();

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

for (let i = 0; i < 10; i++) {
  const timeJS = await getAverageTimeJS(10);

  avgMeasurementsJS.push(timeJS);

  console.log('avgMeasurementsJS', avgMeasurementsJS);
}