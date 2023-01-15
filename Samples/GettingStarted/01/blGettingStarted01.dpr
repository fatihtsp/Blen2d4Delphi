program blGettingStarted01;


{$APPTYPE CONSOLE}

{$R *.res}

uses
  //FastMM5,
  System.SysUtils,
  Blend2D.Api in '..\..\..\Blend2D.Api.pas',
  Blend2D in '..\..\..\Blend2D.pas',
  ftBlend2dDelphiObjectHelperRoutines in '..\..\..\ftBlend2dDelphiObjectHelperRoutines.pas';

procedure Run;
var
  Image   : IBLImage;
  Context : IBLContext;
  Path    : IBLPath;
  Codec   : IBLImageCodec;
  //Codec2  : IBLImageCodec;
  //Codec3  : IBLImageCodec;

begin
  ReportMemoryLeaksOnShutdown := True;
  Image := TBLImage.Create(600, 600);

  { Attach a rendering context into Image. }
  Context := TBLContext.Create(Image);

  { Clear the image. }
  Context.CompOp := TBLCompOp.SrcCopy;

  Context.Start(Image);

  Context.FillAll;

  { Fill some path. }
  Path := TBLPath.Create;
  Path.MoveTo(26, 31);
  Path.CubicTo(642, 132, 587, -136, 25, 464);
  Path.CubicTo(882, 404, 144, 267, 27, 31);

  Context.CompOp := TBLCompOp.SrcOver;
  Context.FillColor := $FFFFFFFF;
  Context.FillPath(Path);

  Context.Finish;    // Detach the rendering context from Image.

  { Let's use some built-in codecs provided by Blend2D. }
  Codec := TBLImageCodec.Create;
  if (Codec.FindByName('BMP')) then
    Image.WriteToFile('blGettingStarted01.bmp', Codec);

  if (Codec.FindByName('PNG')) then
    Image.WriteToFile('blGettingStarted01.png', Codec);

  writeln('Images are written.');

  if blRuntimeCleanup(BL_RUNTIME_CLEANUP_EVERYTHING)=BL_SUCCESS then begin
      writeLn('blRuntimeCleanup success.');
  end else
      writeLn('blRuntimeCleanup failure.');

  if blRuntimeShutdown()=BL_SUCCESS then begin
      writeLn('blRuntimeShutdown success.');
  end else
      writeLn('blRuntimeShutdown failure.');


//  Codec2 := TBLImageCodec.Create;
//  if (Codec.FindByName('JPG')) then
//    Image.WriteToFile('blGettingStarted01.jpg', Codec2);
//
//  Codec3 := TBLImageCodec.Create;
//  if (Codec.FindByName('PNG')) then
//    Image.WriteToFile('blGettingStarted01.png', Codec3);
end;

begin
  try
    Run;
    writeln('OK! Press enter key to exit.');
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
