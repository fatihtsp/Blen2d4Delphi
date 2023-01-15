program blGettingStarted06;

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
  Linear: IBLGradient;
  Path: IBLPath;
  Codec: IBLImageCodec;

begin
  ReportMemoryLeaksOnShutdown := True;
  Image := TBLImage.Create(480, 480);

  Context := TBLContext.Create(Image);
  Context.CompOp := TBLCompOp.SrcCopy;
  Context.FillAll;

  Linear := TBLGradient.Create(BLLinearGradientValues(0, 0, 0, 480));
  Linear.AddStop(0.0, $FFFFFFFF);
  Linear.AddStop(1.0, $FF1F7FFF);

  Path := TBLPath.Create;
  Path.MoveTo(119, 49);
  Path.CubicTo(259, 29, 99, 279, 275, 267);
  Path.CubicTo(537, 245, 300, -170, 274, 430);

  Context.CompOp          := TBLCompOp.SrcOver;
  Context.StrokeGradient  := Linear;
  Context.StrokeWidth     := 15;
  Context.StrokeStartCap  := TBLStrokeCap.Round;
  Context.StrokeEndCap    := TBLStrokeCap.Butt;
  Context.StrokePath(Path);

  Context.Finish;

  Codec := TBLImageCodec.Create;
  Codec := TBLImageCodec.Create;
  if (Codec.FindByName('PNG')) then begin
   Image.WriteToFile('blGettingStarted06.png', Codec);
   writeln('Image is wtitten [blGettingStarted06.png], OK!');
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
