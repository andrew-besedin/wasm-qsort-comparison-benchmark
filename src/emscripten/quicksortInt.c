void quicksortInt(int *array, int start, int end) {
  int pivotId = end;
  int pivot = array[pivotId];

  int currSwapId = start;
  for (int i = start; i < end; i++) {
    if (array[i] <= pivot) {
      int temp = array[i];
      array[i] = array[currSwapId];
      array[currSwapId] = temp;
      currSwapId++;
    }
  }

  array[pivotId] = array[currSwapId];
  array[currSwapId] = pivot;

  
  if (currSwapId - 1 > start) {
    // Push left
    quicksortInt(array, start, currSwapId - 1);
  }

  if (currSwapId + 1 < end) {
    // Push right
    quicksortInt(array, currSwapId + 1, end);
  } 
}
