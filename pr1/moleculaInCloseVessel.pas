unit moleculaInCloseVessel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Math,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    StartStopBtn: TButton;
    Screen: TPaintBox;
    procedure StartStopBtnClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

procedure TForm1.StartStopBtnClick(Sender: TObject);
  var X,Y : Integer;
    Vx,Vy : Integer;
    angle : Real;
    IsRunning : Bool;

    const R : Integer = 10;
          V : Integer = 7 ;

begin
    if IsRunning then
    begin
      IsRunning := false;
      StartStopBtn.Caption := 'Start';
      Exit;
    end;

    StartStopBtn.Caption := 'Stop';
    IsRunning := true;

    Randomize;
    Screen.Refresh;
    X := RandomRange(R,Screen.Width - R)  ;
    Y := RandomRange(R,Screen.Height - R);
    angle := Random(360)*Pi / 180;

    Vx := Round(V * Sin(angle));
    Vy := Round(V * Cos(angle));


      while isRunning do
      begin
        Screen.Canvas.Pen.Color := clBtnFace;
        Screen.Canvas.Ellipse(X - R, Y-R, X + R, Y + R);

        if IsRunning = false then Break;

        X := X + Vx;
        Y := Y + Vy;

        if X > Screen.Width - R then
          begin X := Screen.Width - R; Vx := -Vx; end;
        if X < R then
          begin X := R; Vx := -Vx; end;
        if Y > Screen.Height - R then
          begin Y := Screen.Height - R; Vy := -Vy; end;
        if Y < R then
          begin Y := R; Vy := -Vy; end;

        Screen.Canvas.Pen.Color := clBlue;
        Screen.Canvas.Ellipse(X - R, Y - R, X + R, Y + R);

        Sleep(10);
        Application.ProcessMessages;

      end;
end;

end.
