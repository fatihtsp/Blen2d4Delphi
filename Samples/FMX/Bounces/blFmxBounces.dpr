program blFmxBounces;

uses
  FastMM4,
  System.StartUpCopy,
  FMX.Forms,
  FMain in 'FMain.pas' {FormMain},
  FBase in '..\Common\FBase.pas' {FormBase},
  Blend2d.Api in '..\..\..\Blend2D.Api.pas',
  Blend2D in '..\..\..\Blend2D.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  IsMultiThread := True;
  blRuntimeInit();
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
