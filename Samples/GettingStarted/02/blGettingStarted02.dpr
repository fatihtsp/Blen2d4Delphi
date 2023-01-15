program blGettingStarted02;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  FastMM4,
  System.SysUtils,
  Blend2D.Api,
  ftBlend2dDelphiObjectHelperRoutines,
  Blend2D in '..\..\..\Blend2D.pas';


procedure Run;
var
  Image  : IBLImage;
  Context: IBLContext;
  Linear : IBLGradient;
  conic  : IBLGradient;
  Codec  : IBLImageCodec;

begin
  blRuntimeInit();
  ReportMemoryLeaksOnShutdown := True;
  Image := TBLImage.Create(480, 480);

  Context := TBLContext.Create(Image);
  Context.CompOp := TBLCompOp.SrcCopy;

  Context.Start(Image);
  Context.FillAll;

  Linear := TBLGradient.Create(BLLinearGradientValues(50, 50, 50, 480));  // Coordinates can be specified now or changed later.
  conic  := TBLGradient.Create(BLConicalGradientValues(240, 240, 1));

  Linear.AddStop(0.0, BLRgba32($FFFFFFFF)); // Color stops can be added in any order.
  Linear.AddStop(0.5, BLRgba32($FF5FDDDD));
  Linear.AddStop(1.0, BLRgba32($FF2F5FDF));


  Context.CompOp := TBLCompOp.SrcOut;


  conic.AddStop(0.0, BLRgba32($FFFFFFFF));   //  Color stops can be added in any order
  conic.AddStop(0.5, BLRgba32($FF5FDDDD));
  conic.AddStop(1.0, BLRgba32($FF2F5FDF));

  Context.SetFillStyle(Linear);              // SetFillStyle can be used for both colors and styles.

  Context.SetFillStyle(Conic);


  Context.CompOp := TBLCompOp.SrcOver;
  Context.FillRoundRect(40, 40, 400, 400, 45.5);


  Context.Finish;


  Codec := TBLImageCodec.Create;
  if (Codec.FindByName('PNG')) then Image.WriteToFile('blGettingStarted02.PNG', Codec);
  if (Codec.FindByName('BMP')) then Image.WriteToFile('blGettingStarted02.bmp', Codec);


  Image.Reset;
  Context.Reset;
  Codec.Reset;
  Linear.Reset;
  Conic.Reset;

  //ftFreeblImageCore( Image.Handle );
  //ftFreeblContextCore( Context.Handle );
  //ftFreeblImageCodecCore( Codec.Handle );

  writeln('Images are written by VCL_methods.');

end;

procedure Run_C_Classic;
var
  Image  : PBLImageCore;
  Context: PBLContextCore;
  Linear : PBLGradientCore;
  conic  : PBLGradientCore;
  Radial : PBLGradientCore;
  Codec  : PBLImageCodecCore;
  geoData : Blend2d.Api.BLRoundRect;

begin
    Image   := ftNewblImageCore;      _BLCheck(blImageInitAs(Image, 680, 680, BL_FORMAT_PRGB32));
    Context := ftNewblContextCore;    _BLCheck(blContextInitAs(Context, Image, Nil));
    Linear  := ftNewblGradientCore;   blGradientInit(Linear);
    Radial  := ftNewblGradientCore;   blGradientInit(Radial);
    Codec   := ftNewblImageCodecCore; blImageCodecInit(Codec);

    blContextSetCompOp(Context, BL_COMP_OP_SRC_COPY);
    blContextBegin(Context, Image, Nil);
    blContextSetFillStyleRgba32(Context, BLRgba32($FF00FFAA));
    blContextFillAll(Context);

    var blGrVal: Blend2d.Api.BLLinearGradientValues;
    blGrVal.X0 := 0;blGrVal.Y0 := 0; blGrVal.X1 := 0; blGrVal.Y1 := 680;
    blGradientCreate(Linear, BL_GRADIENT_TYPE_LINEAR, Pointer(@blGrVal),
                     BL_EXTEND_MODE_PAD, Nil, 0, Nil);

    blGradientAddStopRgba32(Linear, 0.0, BlRGBA32($FFFFFFFF));
    blGradientAddStopRgba32(Linear, 0.5, BlRGBA32($FF5FDDDD));
    blGradientAddStopRgba32(Linear, 1.0, BlRGBA32($FF2F5FDF));

    blContextSetFillStyle(Context, Linear);
    geoData := BLRoundRect(400, 400, 200, 200, 20, 20).Handle;
    blContextFillGeometry(Context, BL_GEOMETRY_TYPE_ROUND_RECT, @geoData);

    var blGrRadVal: Blend2d.Api.BLRadialGradientValues;
    blGrRadVal.x0 := 190; blGrRadVal.y0 := 190; blGrRadVal.x1 := 290; blGrRadVal.y1 := 290; blGrRadVal.r0 := 360;
    blGradientCreate(Radial, BL_GRADIENT_TYPE_RADIAL, Pointer(@blGrRadVal),
                     BL_EXTEND_MODE_PAD, Nil, 0, Nil);

    blGradientAddStopRgba32(Radial, 0.0, BlRGBA32($FFFFFFFF));
    blGradientAddStopRgba32(Radial, 0.5, BlRGBA32($FF5F0000));
    blGradientAddStopRgba32(Radial, 1.0, BlRGBA32($FFFF0000));

    blContextSetFillStyle(Context, Radial);

    blContextSetCompOp(Context, BL_COMP_OP_SRC_OVER);
    geoData := BLRoundRect(40, 40, 400, 400, 45.5, 45.5).Handle; //geoData := BLRoundRect(40, 40, 400, 400, 45.5, 45.5).Handle;
    blContextFillGeometry(Context, BL_GEOMETRY_TYPE_ROUND_RECT, @geoData);
    blContextEnd(Context);

    blImageCodecFindByName(Codec, MarshaledAString(UTF8String('PNG')), Length('PNG'), Nil);
    blImageWriteToFile(Image, MarshaledAString(UTF8String('blGettingStarted02_FT.PNG')), Codec);

    blImageCodecFindByName(Codec, MarshaledAString(UTF8String('BMP')), Length('BMP'), Nil);
    blImageWriteToFile(Image, MarshaledAString(UTF8String('blGettingStarted02_FT.BMP')), Codec);


    ftFreeblImageCore(Image);
    ftFreeblContextCore(Context);
    ftFreeblGradientCore(Linear);
    ftFreeblGradientCore(Radial);
    ftFreeblImageCodecCore(Codec);

    writeln('Images are written by C_library methods.');
end;



begin
  try
    Run;

    Run_C_Classic;

    blRuntimeCleanup(BL_RUNTIME_CLEANUP_EVERYTHING);
    blRuntimeShutdown();

    writeln('Press enter key to exit!');
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
