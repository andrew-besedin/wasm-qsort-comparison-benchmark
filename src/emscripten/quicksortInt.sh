emcc ./quicksortInt.c \
  -Os \
  -s WASM=1 \
  -s ALLOW_MEMORY_GROWTH=1 \
  -s "EXPORTED_FUNCTIONS=['_quicksortInt','_malloc','_free']" \
  -o ./../../build/emscripten/quicksortInt.js \
  -s EXPORTED_RUNTIME_METHODS=ccall,cwrap