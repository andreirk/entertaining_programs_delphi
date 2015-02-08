program MoleculasModels;

uses
  Forms,
  moleculaInCloseVessel in '..\..\pr1\moleculaInCloseVessel.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
