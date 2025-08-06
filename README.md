# WASM Quicksort Comparison Benchmark

Created by andrew.besedin for a research publication comparing the performance of JavaScript and WebAssembly.

<b>Note</b>: The Emscripten C files are compiled using the script located in <code>./src/emscripten/*.sh</code>. Before compiling, ensure that the Emscripten SDK and compiler are properly installed on your system. Compilation and subsequent WebAssembly execution have been verified to function reliably with <code>emcc v4.0.12</code>.