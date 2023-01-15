program blGettingStarted04;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Math,
  Blend2D in '..\..\..\Blend2D.pas';

procedure Run;
var
  Image, Texture: IBLImage;
  Pattern: IBLPattern;
  Context: IBLContext;
  Codec: IBLImageCodec;
begin
  ReportMemoryLeaksOnShutdown := True;
  Image := TBLImage.Create(480, 480);

  Context := TBLContext.Create(Image);
  Context.CompOp := TBLCompOp.SrcCopy;
  Context.SetFillStyle(BLRGBA32($FF00FFAA));
  Context.FillAll;


  Texture := TBLImage.Create;  //Read an image from file.
  Texture.ReadFromFile('Resources/texture.jpeg');

  { Rotate by 45 degrees about a point at [240, 240]. }
  Context.Rotate( degTorad(45){0.785398}, 240, 240);

  { Create a pattern. }
  Pattern := TBLPattern.Create(Texture);

  Context.CompOp := TBLCompOp.SrcOver;
  Context.SetFillStyle(Pattern);
  Context.FillRoundRect(50, 50, 380, 380, 80.5);
  Context.Finish;

  Codec := TBLImageCodec.Create;
  if (Codec.Handle <> Nil) then
   if (Codec.FindByName('PNG')) then Image.WriteToFile('blGettingStarted04.png', Codec);
   writeln('Image is wtitten, OK!');
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
