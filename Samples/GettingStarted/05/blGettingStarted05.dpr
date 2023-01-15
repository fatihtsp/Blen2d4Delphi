program blGettingStarted05;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  FastMM4,
  System.SysUtils,
  Blend2D in '..\..\..\Blend2D.pas';

procedure Run;
var
  Image: IBLImage;
  Context: IBLContext;
  Radial, Linear: IBLGradient;
  Codec: IBLImageCodec;

begin
  ReportMemoryLeaksOnShutdown := True;
  Image := TBLImage.Create(1200, 900);

  Context := TBLContext.Create(Image);
  Context.CompOp := TBLCompOp.SrcCopy;
  Context.FillAll;

  { First shape filled by a radial gradient. }
  Radial := TBLGradient.Create(BLRadialGradientValues(180, 180, 280, 280, 180));
  Radial.AddStop(0.0, BLRgba32($FFFFFFFF));
  Radial.AddStop(1.0, BLRgba32($FFFF6F3F));

  Context.CompOp := TBLCompOp.SrcOver;
  Context.SetFillStyle(Radial);
  Context.FillCircle(180, 180, 160);

  { Second shape filled by a linear gradient. }
  Linear := TBLGradient.Create(BLLinearGradientValues(195, 195, 470, 470));
  Linear.AddStop(0.0, BLRgba32($FFFFFFFF));
  Linear.AddStop(1.0, BLRgba32($FF3F9FFF));

  Context.CompOp := TBLCompOp.Difference;
  Context.SetFillStyle(Linear);
  Context.FillRoundRect(195, 195, 270, 270, 25);

  Context.CompOp := TBLCompOp.SrcOver;
  Linear.SetValues(BLLinearGradientValues(500, 500, 770, 770));
  Linear.AddStop(0.0, BLRgba32($FFFFFFFF));
  Linear.AddStop(1.0, BLRgba32($FF3F9FFF));
  Context.SetFillStyle(Linear);
  Context.FillRoundRect(500, 500, 270, 270, 50);


  Context.Finish;

  Codec := TBLImageCodec.Create;
  if (Codec.FindByName('PNG')) then begin
   Image.WriteToFile('blGettingStarted05.png', Codec);
   writeln('Image is wtitten [blGettingStarted05.png], OK!');
  end;
end;

begin
  try
    Run;

    writeln('Press enter key to exit.');
    ReadLn;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
