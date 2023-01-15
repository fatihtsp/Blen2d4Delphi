program blGettingStarted07;

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
  Face: IBLFontFace;
  Font: IBLFont;
  Codec: IBLImageCodec;

begin
  ReportMemoryLeaksOnShutdown := True;
  Image := TBLImage.Create(680, 680);

  Context := TBLContext.Create(Image);
  Context.CompOp := TBLCompOp.SrcCopy;

  Context.Start(Image);

  Context.FillAll;


  Face := TBLFontFace.Create;
  Face.InitializeFromFile('Resources/NotoSans-Regular.ttf', [TBLFileReadFlag.MmapEnabled]);

  Font := TBLFont.Create;
  Font.InitializeFromFace(Face, 50);

  Context.FillColor := $FFFFFFFF;
  Context.FillText(BLPoint(60, 80), Font, 'Hello Blend2D!');

  Context.FillText(BLPoint(60, 280), Font, 'Rotated Text');

  Context.Rotate(0.785398);
  Context.SetFillStyle(BLRGBA32($FF00DDDD));
  Context.FillText(BLPoint(460, 180), Font, 'Rotated Text');

  Context.SetFillStyle(BLRGBA32($FF0000DD));
  Context.FillText(BLPoint(480, 80), Font, 'Rotated Text');

  Context.Finish;

  Codec := TBLImageCodec.Create;
  if (Codec.FindByName('PNG')) then begin
    Image.WriteToFile('blGettingStarted07.png', Codec);
    writeln('Image is wtitten [blGettingStarted07.png], OK!');
  end;

  Font.Reset;
  Context.Reset;
end;

begin
  try
    Run;
    writeln('OK. Press enter key to Exit.');
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
