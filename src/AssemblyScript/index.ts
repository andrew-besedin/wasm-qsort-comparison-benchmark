// The entry file of your WebAssembly module.

// class ArrBounds {
//   start: i32 = 0;
//   end: i32 = 0;
// }

function qsort_part(array: Int32Array, start: i32, end: i32): void {

  const pivotId = end;
  const pivot = array[pivotId];

  let currSwapId = start;
  for (let i = start; i < end; i++) {
    if (array[i] <= pivot) {
      const temp = array[i];
      array[i] = array[currSwapId];
      array[currSwapId] = temp;
      currSwapId++;
    }
  }

  array[pivotId] = array[currSwapId];
  array[currSwapId] = pivot;

  
  if (currSwapId - 1 > start) {
    // Push left
    qsort_part(array, start, currSwapId - 1);
  }

  if (currSwapId + 1 < end) {
    // Push right
    qsort_part(array, currSwapId + 1, end);
  }

}

export function qsort(array: Int32Array): Int32Array {
  qsort_part(array, 0, array.length - 1);
  return array;
}

export function garbageCollect(): void {
  __collect();
}