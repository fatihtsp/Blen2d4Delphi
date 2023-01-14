# Blen2d4Delphi
Blen2d4Delphi is alive again! [fatihtsp]


### Overview
Blend2D (https://blend2d.com & https://github.com/blend2d/blend2d) is a high performance 2D vector graphics engine written in C++ and released under the Zlib license. The engine utilizes a built-in JIT compiler to generate optimized pipelines at runtime and is capable of using multiple threads to boost the performance beyond the possibilities of single-threaded rendering. Additionally, the engine features a new rasterizer that has been written from scratch. It delivers superior performance while quality is comparable to rasterizers used by AGG and FreeType. The performance has been optimized by using an innovative approach to index data that is built during rasterization and scanned during composition. The rasterizer is robust and excels in rendering complex vector art and text.

The api porting of Blen2d for Delphi was started by #neslib orginally (Erik van Bilsen: https://github.com/neslib/DelphiBlend2D) but not continued updates after some version. I guess due to frequent code changes in the orginal Blend2d API makes difficult to port it to Delphi. I've completely port to Blend2d api using neslib's study. Here, the given dll file has object declerations (const. & destr.) and can be called from Delphi. The Delphi samples works, please test. Also, the comparisons with FMX have been given.

### Getting Started
* Dowload the Blen2d4Delphi repository: git clone https://github.com/fatihtsp/Blen2d4Delphi
* open the Delphi package



