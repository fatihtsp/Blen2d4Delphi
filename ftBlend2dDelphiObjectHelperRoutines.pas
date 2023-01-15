
unit ftBlend2dDelphiObjectHelperRoutines;

{ Blend2D for Delphi [new delphi port based on Blend2d version_0.0.18].        }
{                                                                              }
{ Overview                                                                     }
{                                                                              }
{ Blend2D (https://blend2d.com & https://github.com/blend2d/blend2d) is a high }
{ performance 2D vector graphics engine written in C++ and released under      }
{ the Zlib license. The engine utilizes a built-in JIT compiler to generate    }
{ optimized pipelines at runtime and is capable of using multiple threads to   }
{boost the performance beyond the possibilities of single-threaded rendering.  }
{ Additionally, the engine features a new rasterizer that has been written     }
{ from scratch. It delivers superior performance while quality is comparable to}
{ rasterizers used by AGG and FreeType. The performance has been optimized by  }
{ using an innovative approach to index data that is built during rasterization}
{ and scanned during composition. The rasterizer is robust and excels in       }
{ rendering complex vector art and text.                                       }
{                                                                              }
{ The Api of Blen2d for Delphi was started by #neslib orginally                }
{ (Erik van Bilsen: https://github.com/neslib/DelphiBlend2D) but not continued }
{ updates after some version. I guess due to frequent code changes             }
{ in the orginal Blend2d API makes difficult to port it to Delphi.             }
{ I've completely port to Blend2d api using neslib's study.                    }
{ Here, the given dll file has object declerations (const. & destr.) and       }
{ can be called from Delphi. The Delphi samples works, you can play.           }
{ Also, the comparisons with FMX have been given. Have fun.                    }
{                                                                              }
{ Copyright (c) 2023 Dr. Fatih Taspinar, fatihtsp@gmail.com                    }
{ All rights reserved.                                                         }
{                                                                              }
{ Date: 15.01.2023                                                             }
{                                                                              }
{ Notes:                                                                       }
{ Have fun.                                                                    }
{******************************************************************************}


interface

uses System.Classes, Blend2d.Api;


function ftNewblArrayCore(): PBLArrayCore;                      cdecl;  external LIB_BLEND2D name _PU + 'ftNewblArrayCore';
function ftFreeblArrayCore(objPointer: PBLArrayCore): BLResult; cdecl;  external LIB_BLEND2D name _PU + 'ftFreeblArrayCore';

function ftNewblObjectCore(): PBLObjectCore;                      cdecl;  external LIB_BLEND2D name _PU + 'ftNewblObjectCore';
function ftFreeblObjectCore(objPointer: PBLObjectCore): BLResult; cdecl;  external LIB_BLEND2D name _PU + 'ftFreeblObjectCore';

function ftNewblImageCore(): PBLImageCore;                      cdecl;  external LIB_BLEND2D name _PU + 'ftNewblImageCore';
function ftFreeblImageCore(objPointer: PBLImageCore): BLResult; cdecl;  external LIB_BLEND2D name _PU + 'ftFreeblImageCore';

function ftNewblImageCodecCore(): PBLImageCodecCore;                      cdecl;  external LIB_BLEND2D name _PU + 'ftNewblImageCodecCore';
function ftFreeblImageCodecCore(objPointer: PBLImageCodecCore): BLResult; cdecl;  external LIB_BLEND2D name _PU + 'ftFreeblImageCodecCore';

function ftNewblImageDecoderCore(): PBLImageDecoderCore;                      cdecl;  external LIB_BLEND2D name _PU + 'ftNewblImageDecoderCore';
function ftFreeblImageDecoderCore(objPointer: PBLImageDecoderCore): BLResult; cdecl;  external LIB_BLEND2D name _PU + 'ftFreeblImageDecoderCore';

function ftNewblImageEncoderCore(): PBLImageEncoderCore;                      cdecl;  external LIB_BLEND2D name _PU + 'ftNewblImageEncoderCore';
function ftFreeblImageEncoderCore(objPointer: PBLImageEncoderCore): BLResult; cdecl;  external LIB_BLEND2D name _PU + 'ftFreeblImageEncoderCore';

function ftNewblContextCore(): PBLContextCore;                      cdecl;  external LIB_BLEND2D name _PU + 'ftNewblContextCore';
function ftFreeblContextCore(objPointer: PBLContextCore): BLResult; cdecl;  external LIB_BLEND2D name _PU + 'ftFreeblContextCore';
function ftGetblContextState(ContextCorePointer: PBLContextCore): _PBLContextState; cdecl;  external LIB_BLEND2D name _PU + 'ftGetblContextState';
function ftGetblContextCoreEquals(ContextCorePointer: PBLContextCore; other: PBLContextCore): Boolean; cdecl;  external LIB_BLEND2D name _PU + 'ftGetblContextCoreEquals';
function ftGetblContextType(ContextCorePointer: PBLContextCore): UInt32; cdecl;  external LIB_BLEND2D name _PU + 'ftGetblContextType';

function ftNewblGradientCore(): PBLGradientCore;                      cdecl;  external LIB_BLEND2D name _PU + 'ftNewblGradientCore';
function ftFreeblGradientCore(objPointer: PBLGradientCore): BLResult; cdecl;  external LIB_BLEND2D name _PU + 'ftFreeblGradientCore';

function ftNewblPathCore(): PBLPathCore;                      cdecl;  external LIB_BLEND2D name _PU + 'ftNewblPathCore';
function ftFreeblPathCore(objPointer: PBLPathCore): BLResult; cdecl;  external LIB_BLEND2D name _PU + 'ftFreeblPathCore';

function ftNewblPatternCore(): PBLPatternCore;                      cdecl;  external LIB_BLEND2D name _PU + 'ftNewblPatternCore';
function ftFreeblPatternCore(objPointer: PBLPatternCore): BLResult; cdecl;  external LIB_BLEND2D name _PU + 'ftFreeblPatternCore';

function ftNewblFontCore(): PBLFontCore;                      cdecl;  external LIB_BLEND2D name _PU + 'ftNewblFontCore';
function ftFreeblFontCore(objPointer: PBLFontCore): BLResult; cdecl;  external LIB_BLEND2D name _PU + 'ftFreeblFontCore';

function ftNewblFontFaceCore(): PBLFontFaceCore;                      cdecl;  external LIB_BLEND2D name _PU + 'ftNewblFontFaceCore';
function ftFreeblFontFaceCore(objPointer: PBLFontFaceCore): BLResult; cdecl;  external LIB_BLEND2D name _PU + 'ftFreeblFontFaceCore';

function ftNewblFontDataCore(): PBLFontDataCore;                    cdecl;  external LIB_BLEND2D name _PU + 'ftNewblFontDataCore';
function ftFreeblFontDataCore(objPointer: PBLFontDataCore): BLResult; cdecl;  external LIB_BLEND2D name _PU + 'ftFreeblFontDataCore';

function ftNewblStringCore(): PBLStringCore;                      cdecl;  external LIB_BLEND2D name _PU + 'ftNewblStringCore';
function ftFreeblStringCore(objPointer: PBLStringCore): BLResult; cdecl;  external LIB_BLEND2D name _PU + 'ftFreeblStringCore';

function ftNewblMatrix2D(): _PBLMatrix2D;                      cdecl;  external LIB_BLEND2D name _PU + 'ftNewblMatrix2D';
function ftFreeblMatrix2D(objPointer: _PBLMatrix2D): BLResult; cdecl;  external LIB_BLEND2D name _PU + 'ftFreeblMatrix2D';

function ftNewblBitSetCore(): PBLBitSetCore;                      cdecl;  external LIB_BLEND2D name _PU + 'ftNewblBitSetCore';
function ftFreeblBitSetCore(objPointer: PBLBitSetCore): BLResult; cdecl;  external LIB_BLEND2D name _PU + 'ftFreeblBitSetCore';

function ftNewblGlyphBufferCore(): PBLGlyphBufferCore;             cdecl;  external LIB_BLEND2D name _PU + 'ftNewblGlyphBufferCore';
function ftFreeblGlyphBufferCore(): BLResult;                      cdecl;  external LIB_BLEND2D name _PU + 'ftFreeblGlyphBufferCore';
function ftGetblGlyphBufferRun(GlyphBufferCorePointer: PBLGlyphBufferCore): _PBLGlyphRun; cdecl;  external LIB_BLEND2D name _PU + 'ftGetblGlyphBufferRun';


function ftGetPathCoreView(PathCorePointer: PBLPathCore; out_blPathView: _PBLPathView): BLResult; cdecl;  external LIB_BLEND2D name _PU + 'ftGetPathCoreView';
function ftGetblLastDecoderResult(self: PBLImageDecoderCore): BLResult;  cdecl; external LIB_BLEND2D name _PU + 'ftGetblLastDecoderResult';
function ftGetblLastEncoderResult(self: PBLImageEncoderCore): BLResult;  cdecl; external LIB_BLEND2D name _PU + 'ftGetblLastEncoderResult';

function ftGetblImageCodecExtensions(self: PBLImageCodecCore): PPUTF8Char; cdecl;  external LIB_BLEND2D name _PU + 'ftGetblImageCodecExtensions';
function ftGetblImageCodecName(self: PBLImageCodecCore): PPUTF8Char; cdecl;  external LIB_BLEND2D name _PU + 'ftGetblImageCodecName';
function ftGetblImageCodecVendor(self: PBLImageCodecCore): PPUTF8Char; cdecl;  external LIB_BLEND2D name _PU + 'ftGetblImageCodecVendor';
function ftGetblImageCodecMimeType(self: PBLImageCodecCore): PPUTF8Char; cdecl;  external LIB_BLEND2D name _PU + 'ftGetblImageCodecMimeType';
function ftGetblImageCodecFeatures(self: PBLImageCodecCore): NativeUInt; cdecl;  external LIB_BLEND2D name _PU + 'ftGetblImageCodecFeatures';
function ftGetblImageCodecHasFeature(self: PBLImageCodecCore; Codecfeature: NativeUInt): Boolean; cdecl;  external LIB_BLEND2D name _PU + 'ftGetblImageCodecHasFeature';

function ftGetblPatternHasMatrix(self:PBLPatternCore): Boolean; cdecl; external LIB_BLEND2D name _PU + 'ftGetblPatternHasMatrix';

function ftGetblFontDataFaceCount(FontDCore: PBLFontDataCore): UInt32; external LIB_BLEND2D name _PU + 'ftGetblFontDataFaceCount';
function ftGetblFontDataFaceType(FontDCore: PBLFontDataCore) : UInt8; external LIB_BLEND2D name _PU  + 'ftGetblFontDataFaceType';
function ftGetblFontDataFaceFlags(FontDCore: PBLFontDataCore): UInt32; external LIB_BLEND2D name _PU + 'ftGetblFontDataFaceFlags';

function ftGetblFontFaceFamilyName(FFCore: PBLFontFaceCore;  StrSize: PNativeUInt): PUtf8Char;       cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontFaceFamilyName';
function ftGetblFontFaceFullName(FFCore: PBLFontFaceCore;  StrSize: PNativeUInt): PUtf8Char;         cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontFaceFullName';
function ftGetblFontFacePostScriptName(FFCore: PBLFontFaceCore;  StrSize: PNativeUInt): PUtf8Char;   cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontFacePostScriptName';
function ftGetblFontFaceSubfamilyName(FFCore: PBLFontFaceCore;  StrSize: PNativeUInt): PUtf8Char;    cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontFaceSubfamilyName';
function ftGetblFontFaceInfoFaceFlags(FFCore: PBLFontFaceCore): UInt32;                              cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontFaceInfoFaceFlags';
function ftGetblFontFaceUniqueID(FFCore: PBLFontFaceCore): UInt64;                                   cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontFaceUniqueID';
function ftGetblFontFaceUnitsPerEm(FFCore: PBLFontFaceCore): Integer;                                cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontFaceUnitsPerEm';
function ftGetblFontFaceImpl(FFCore: PBLFontFaceCore): _PBLFontFaceImpl;                             cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontFaceImpl';
function ftGetblFontFaceStretch(FFCore: PBLFontFaceCore): UInt32;                                    cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontFaceStretch';
function ftGetblFontFaceWeigth(FFCore: PBLFontFaceCore): UInt32;                                     cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontFaceWeigth';
function ftGetblFontFaceStyle(FFCore: PBLFontFaceCore): UInt32;                                      cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontFaceStyle';
function ftGetblFontFacePanose(FFCore: PBLFontFaceCore): _PBLFontPanose;                             cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontFacePanose';
function ftGetblFontFaceFlags(FFCore: PBLFontCore): UInt32;                                          cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontFaceFlags';
function ftGetblFontFaceType(FFCore: PBLFontCore): UInt32;                                           cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontFaceType';

function ftNewblFontFeatureSettingsCore(): PBLFontFeatureSettingsCore;              cdecl; external LIB_BLEND2D name _PU + 'ftNewblFontFeatureSettingsCore';
function ftFreeblFontFeatureSettingsCore(fc: PBLFontFeatureSettingsCore): BLResult; cdecl; external LIB_BLEND2D name _PU + 'ftFreeblFontFeatureSettingsCore';
function ftGetblFontFeatureSettingsCoreData(fc: PBLFontFeatureSettingsCore; ItemCount: PNativeUInt): PBLFontFeatureItem; cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontFeatureSettingsCoreData';

function ftGetblFontStretch(FFCore: PBLFontCore): UInt32;                                    cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontStretch';
function ftGetblFontWeigth(FFCore: PBLFontCore): UInt32;                                     cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontWeigth';
function ftGetblFontStyle(FFCore: PBLFontCore): UInt32;                                      cdecl; external LIB_BLEND2D name _PU + 'ftGetblFontStyle';


implementation

end.
