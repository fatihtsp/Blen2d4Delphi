program blGettingStarted08;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  FastMM4,
  System.SysUtils,
  Blend2D.Api,
  ftBlend2dDelphiObjectHelperRoutines,
  Blend2D in '..\..\..\Blend2D.pas';

procedure Run;
const
  TEXTS: array [0..2] of String = (
    'Hello Blend2D!',
    'I''m a simple multiline text example',
    'that uses IBLGlyphBuffer and FillGlyphRun!');
var
  Image: IBLImage;
  Context: IBLContext;
  Face: IBLFontFace;
  Font: IBLFont;
  FontMetrics: TBLFontMetrics;
  TextMetrics: TBLTextMetrics;
  GlyphBuffer: IBLGlyphBuffer;
  P: TBLPoint;
  I: Integer;
  Codec: IBLImageCodec;

begin
  ReportMemoryLeaksOnShutdown := True;
  Image := TBLImage.Create(680, 680);

  Context := TBLContext.Create(Image);
  Context.Start( Image );
  Context.CompOp := TBLCompOp.SrcCopy;
  Context.SetFillStyle(blRGBA32($FF000000));
  Context.FillAll;
  Context.FillColor := BLRgba32($FFFFFFFF);

  Face := TBLFontFace.Create;
  Face.InitializeFromFile('Resources/NotoSans-Regular.ttf');


  Font := TBLFont.Create;
  Font.InitializeFromFace(Face, 20);

  FontMetrics := Font.Metrics;
  GlyphBuffer := TBLGlyphBuffer.Create;


  P.Reset(20, 180 + FontMetrics.Ascent);

  for I := 0 to Length(TEXTS) - 1 do begin
    GlyphBuffer.SetText(TEXTS[I]);
    Font.Shape(GlyphBuffer);
    TextMetrics := Font.GetTextMetrics(GlyphBuffer);

    P.X := (680 - TextMetrics.BoundingBox.Width) / 2;
    Context.FillGlyphRun(P, Font, GlyphBuffer.GlyphRun);
    P.Y := P.Y + FontMetrics.Ascent + FontMetrics.Descent + FontMetrics.LineGap;
  end;

  Context.Finish;

  Codec := TBLImageCodec.Create;
  if (Codec.FindByName('PNG')) then begin
    Image.WriteToFile('blGettingStarted08.png', Codec);
    writeln('Image is wtitten [blGettingStarted08.png], OK!');
  end;

  Context.Reset;
  Image.Reset;
  GlyphBuffer.Reset;
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
