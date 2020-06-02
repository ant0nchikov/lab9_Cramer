unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids;

type
  TForm1 = class(TForm)
    Isxodnaya: TLabel;
    SG1: TStringGrid;
    Vektor: TLabel;
    Sg2: TStringGrid;
    Razmernost: TLabel;
    Edit: TEdit;
    UpDown: TUpDown;
    Count: TButton;
    Close: TBitBtn;
    ComboBox: TComboBox;
    Metod: TLabel;
    Vvod: TButton;
    Zapis: TButton;
    Chtenie: TButton;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Sg3: TStringGrid;
    SG4: TStringGrid;
    SG5: TStringGrid;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    procedure Float(var Key: Char);
    procedure Float2(var Key: Char);
    procedure FormClick(Sender: TObject);
    procedure VvodClick(Sender: TObject);
    procedure CountClick(Sender: TObject);
    procedure SG1KeyPress(Sender: TObject; var Key: Char);
    procedure Sg2KeyPress(Sender: TObject; var Key: Char);
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure ZapisClick(Sender: TObject);
    procedure ChtenieClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

type
  mas = array of array of real;
  vekt = array of real;


var
  a,x,g,z,f,aa,aab,aap: mas;
  b,e,c,u:vekt;
  m,k,kk,k1,k2:integer;
  s1,s2,s3,s4,s5,s6,sd,ss:real;

procedure Tform1.Float(var Key: Char);
var allow:string;i:integer;ok:boolean;
begin
  allow:='1234567890-,'+#8;
  ok:=false;
  for i:=1 to length(allow)do
  if key=allow[i]then ok:=true;
  if not ok then key:=#0;
end;

procedure Tform1.Float2(var Key: Char);
var allow:string;i:integer;ok:boolean;
begin
  allow:='1234567890'+#8;
  ok:=false;
  for i:=1 to length(allow)do
  if key=allow[i]then ok:=true;
  if not ok then key:=#0;
end;

function determinant():real;
var d,k,k1,k2,i,j: integer;
    r:real;
begin
          for k:=0 to m-1 do begin
  if aab[k,k]=0 then
  for k1:=k+1 to m-1 do
  for k2:=k to m-1 do
  begin
   r:=aab[k1,k2];
     aab[k1,k2]:=aab[k,k2];
     aab[k,k2]:=r;
  end;
         for i:=k+1 to m-1 do begin
            r:=aab[i, k];
            for j:=k to m-1 do
               aab[i, j]:=aab[i,j]-r*(aab[k, j]/aab[k, k]);
            end;
          end;
         ss:=1;
     for i:=0 to m-1 do
         ss:=ss*aab[i,i];

   determinant := ss;
end;

procedure TForm1.FormClick(Sender: TObject);
begin
SG1.Visible:=true;
SG2.Visible:=true;
Isxodnaya.Visible:=true;
Vektor.Visible:=true;
Metod.Visible:=true;
Combobox.Visible:=true;
SG1.ColCount:=strtoint(Edit.Text);
SG2.RowCount:=strtoint(Edit.Text);
SG1.RowCount:=strtoint(Edit.Text);
end;

procedure TForm1.VvodClick(Sender: TObject);
begin
Razmernost.Visible:=true;
Edit.Visible:=true;
UpDown.Visible:=true;
end;

procedure TForm1.CountClick(Sender: TObject);
var
i,j,cc,l,k: integer;
pr1,pr2,zero:boolean;
y,sum,g,r,sO:real;
s :string;
begin
pr1:=true;
pr2:=true;
for i:=1 to SG1.RowCount-1 do
for j:=1 to SG1.ColCount-1 do
if SG1.Cells[i,j]='' then
pr1:=false;
for i:=1 to SG2.ColCount-1 do
if SG2.Cells[1,i]='' then
pr2:=false;
if (pr1=false) or (pr2=false) then
MessageDlg('Заполните весь SG',mtError,[mbOk],0)
else
begin
  m:=strtoint(Edit.Text);
  PageControl.Visible:=true;

  SetLength(a,m,m);
  Setlength(x,m,m);
  Setlength(f,m,m);
  Setlength(z,m,m);
  Setlength(aa,m,m);
  Setlength(aab,m,m);
  Setlength(aap,m,m);
  Setlength(b,m);
  Setlength(e,m);
  Setlength(c,m);
  Setlength(u,m);


  for i:=0 to m-1 do
  for j:=0 to m-1 do
  a[i,j]:=strtofloat(SG1.Cells[j,i]);
  for i:=0 to m-1 do
  b[i]:=strtofloat(SG2.Cells[0,i]);

  if Combobox.ItemIndex=-1 then
  MessageDlg('Выберите метод решения',mtError,[mbOk],0)

  else if Combobox.ItemIndex=0 then
  begin
    PageControl.ActivePage:=TabSheet1;
    SG5.RowCount:=strtoint(Edit.Text);
    SG3.RowCount:=strtoint(Edit.Text);
    SG4.ColCount:=2;
    SG4.RowCount:=2;
    SG4.Cells[1,1]:='';

    zero:=false;
        for i:=0 to m-1 do
          for j:=0 to m-1 do
            x[i,j]:=a[i,j];
        i:=0;
        cc:=0;
        if zero=false then for l:=1 to m-1 do
        begin
          if x[i,i]=0 then
            for j:=i+1 to m-1 do
              begin
              if x[j,i]<>0 then
                for k:=0 to m-1 do
                begin
                  y:=x[i,k];
                  x[i,k]:=x[j,k];
                  x[j,k]:=y;
                end;
                inc(cc);
                break;
              end;
          if zero=false then for j:=i+1 to m-1 do
            begin
              y:=-(x[j,i]/x[i,i]);
              for k:=i to m-1 do
                x[j,k]:=x[j,k]+x[i,k]*y;
              zero:=true;
              for k:=i+1 to m-1 do
                if x[j,k]<>0 then
                  zero:=false;
            end;
          inc(i);
        end;
        if zero=true then
          y:=0
        else
          begin
            y:=1;
            for i:=0 to m-1 do
              y:=y*x[i,i];
            if odd(cc) then
              y:=-y;
          end;

    if y=0 then
    MessageDlg('Невозможно решить такую СЛАУ блочным методом',mtError,[mbOk],0)
    else begin
      for i:=0 to m-1 do
      for j:=0 to m-1 do
      f[i,j]:=a[i,j];
      for k:=0 to m-1 do
        begin
        for i:=0 to m-1 do
        for j:=0 to m-1 do
          begin
          if ((i<>k) and (j<>k)) then
          z[i,j]:=f[i,j]-f[k,j]*f[i,k]/f[k,k];
          if ((i=k) and (j<>k)) then
          z[i,j]:=f[k,j]/f[k,k];
          if ((i<>k) and (j=k)) then
          z[i,j]:=-f[i,k]/f[k,k];
          if ((i=k) and (j=k)) then
          z[i,j]:=1/f[k,k];
          end;
        for i:=0 to m-1 do
        for j:=0 to m-1 do
        f[i,j]:=z[i,j];
        end;
      for i:=0 to m-1 do
      for j:=0 to m-1 do
      end;
 {<!--}
    for i:=0 to m-1 do
      begin
        e[i]:=0;
        for j:=0 to m-1 do
          begin
            r:=f[i,j]*b[j];
         e[i]:=r+e[i];
          end;
      end;

    for i:=0 to m-1 do
      for j:=0 to m-1 do
        SG3.Cells[j,i]:=floattostr(e[i]);

    for i:=0 to m-1 do
    for j:=0 to m-1 do
    begin
    sum:=0;
    for k:=0 to m-1 do sum:=sum+a[i,k]*e[k];
    c[i]:=sum;
    end;
    for i:=0 to m-1 do
    for j:=0 to m-1 do
    SG5.Cells[j,i]:=floattostr(c[i]);
  end

  else begin
    PageControl.ActivePage:=TabSheet2;
    SG5.RowCount:=strtoint(Edit.Text);
    SG4.RowCount:=strtoint(Edit.Text);
    SG3.ColCount:=1;
    SG3.RowCount:=m;
    SG3.Cells[1,1]:='';

     zero:=false;
        for i:=0 to m-1 do
          for j:=0 to m-1 do
            x[i,j]:=a[i,j];
        i:=0;
        cc:=0;
        if zero=false then for l:=1 to m-1 do
        begin
          if x[i,i]=0 then
            for j:=i+1 to m-1 do
              begin
              if x[j,i]<>0 then
                for k:=0 to m-1 do
                begin
                  y:=x[i,k];
                  x[i,k]:=x[j,k];
                  x[j,k]:=y;
                end;
                inc(cc);
                break;
              end;
          if zero=false then for j:=i+1 to m-1 do
            begin
              y:=-(x[j,i]/x[i,i]);
              for k:=i to m-1 do
                x[j,k]:=x[j,k]+x[i,k]*y;
              zero:=true;
              for k:=i+1 to m-1 do
                if x[j,k]<>0 then
                  zero:=false;
            end;
          inc(i);
        end;
        if zero=true then
          y:=0
        else
          begin
            y:=1;
            for i:=0 to m-1 do
              y:=y*x[i,i];
            if odd(cc) then
              y:=-y;
          end;

    if y=0 then
    MessageDlg('Невозможно решить такую СЛАУ методом Крамера',mtError,[mbOk],0)
    else begin

    for i:=0 to m-1 do
      for j:=0 to m-1 do
        aa[i,j]:=a[j,i];

    for i:=0 to m-1 do
      for j:=0 to m-1 do
        aab[i,j]:=aa[i,j];

    //Главный определитель матрицы А. Начало.
           for k:=0 to m-1 do begin
  if aa[k,k]=0 then
  for k1:=k+1 to m-1 do
  for k2:=k to m-1 do
  begin
   r:=aa[k1,k2];
     aa[k1,k2]:=aa[k,k2];
     aa[k,k2]:=r;
  end;
         for i:=k+1 to m-1 do begin
            r:=aa[i, k];
            for j:=k to m-1 do
               aa[i, j]:=aa[i,j]-r*(aa[k, j]/aa[k, k]);
            end;
          end;
              sO:=1;
     for i:=0 to m-1 do
         sO:=sO*aa[i, i];
   //Главный определитель матрицы A. Конец.


    //Метод Крамера. Начало.

   //Матрица 2x2 методом Крамера
    if (m = 2) and (m = 2) then
     begin

       for i:=0 to m-1 do
      for j:=0 to m-1 do
        aap[i,j]:=aab[i,j];

     aab[0,0]:=Abs(b[0]);
     aab[0,1]:=Abs(b[1]);
     s1:=determinant();


     for i:=0 to m-1 do
      for j:=0 to m-1 do
        aab[i,j]:=aap[i,j];

     aab[1,0]:=Abs(b[0]);
     aab[1,1]:=Abs(b[1]);
     s2:=determinant();

     s1:=s1/sO;
     s2:=s2/sO;

     e[0]:=s1;
     e[1]:=s2;

     SG4.Cells[0,0]:=floattostr(s1);
     SG4.Cells[0,1]:=floattostr(s2);


    end;
    //Матрица 2x2 методом Крамера

    //Матрица 3x3 Методом крамера. Начало.
          if (m = 3) and (m = 3) then
    begin

       for i:=0 to m-1 do
      for j:=0 to m-1 do
        aap[i,j]:=aab[i,j];


     aab[0,0]:=b[0];
     aab[0,1]:=b[1];
     aab[0,2]:=b[2];
     s1:=determinant();

     for i:=0 to m-1 do
      for j:=0 to m-1 do
        aab[i,j]:=aap[i,j];

     aab[1,0]:=b[0];
     aab[1,1]:=b[1];
     aab[1,2]:=b[2];
     s2:=determinant();

     for i:=0 to m-1 do
      for j:=0 to m-1 do
        aab[i,j]:=aap[i,j];

     aab[2,0]:=b[0];
     aab[2,1]:=b[1];
     aab[2,2]:=b[2];
     s3:=determinant();

     s1:=s1/sO;
     s2:=abs(s2/sO);
     s3:=s3/sO;

     e[0]:=s1;
     e[1]:=s2;
     e[2]:=s3;


     SG4.Cells[0,0]:=floattostr(s1);
     SG4.Cells[0,1]:=floattostr(s2);
     SG4.Cells[0,2]:=floattostr(s3);

    end;
    //Матрица 3x3 Методом крамера. Конец.


    //Матрица 4x4 Методом крамера. Начало.
        if (m = 4) and (m = 4) then
    begin
         for i:=0 to m-1 do
      for j:=0 to m-1 do
        aap[i,j]:=aab[i,j];

     aab[0,0]:=b[0];
     aab[0,1]:=b[1];
     aab[0,2]:=b[2];
     aab[0,3]:=b[3];
     s1:=determinant();

     for i:=0 to m-1 do
      for j:=0 to m-1 do
        aab[i,j]:=aap[i,j];

     aab[1,0]:=b[0];
     aab[1,1]:=b[1];
     aab[1,2]:=b[2];
     aab[1,3]:=b[3];
     s2:=determinant();

     for i:=0 to m-1 do
      for j:=0 to m-1 do
        aab[i,j]:=aap[i,j];

     aab[2,0]:=b[0];
     aab[2,1]:=b[1];
     aab[2,2]:=b[2];
     aab[2,3]:=b[3];
     s3:=determinant();

     for i:=0 to m-1 do
      for j:=0 to m-1 do
        aab[i,j]:=aap[i,j];

     aab[3,0]:=b[0];
     aab[3,1]:=b[1];
     aab[3,2]:=b[2];
     aab[3,3]:=b[3];
     s4:=determinant();

     s1:=s1/sO;
     s2:=s2/sO;
     s3:=s3/sO;
     s4:=s4/sO;

     e[0]:=s1;
     e[1]:=s2;
     e[2]:=s3;
     e[3]:=s4;

     SG4.Cells[0,0]:=floattostr(s1);
     SG4.Cells[0,1]:=floattostr(s2);
     SG4.Cells[0,2]:=floattostr(s3);
     SG4.Cells[0,3]:=floattostr(s4);

    end;
    //Матрица 4x4 Методом крамера. Конец.

    //Матрица 5x5 Методом крамера. Начало.
        if (m = 5) and (m = 5) then
    begin
             for i:=0 to m-1 do
      for j:=0 to m-1 do
        aap[i,j]:=aab[i,j];

     aab[0,0]:=b[0];
     aab[0,1]:=b[1];
     aab[0,2]:=b[2];
     aab[0,3]:=b[3];
     aab[0,4]:=b[4];
     s1:=determinant();

     for i:=0 to m-1 do
      for j:=0 to m-1 do
        aab[i,j]:=aap[i,j];

     aab[1,0]:=b[0];
     aab[1,1]:=b[1];
     aab[1,2]:=b[2];
     aab[1,3]:=b[3];
     aab[1,4]:=b[4];
     s2:=determinant();

     for i:=0 to m-1 do
      for j:=0 to m-1 do
        aab[i,j]:=aap[i,j];

     aab[2,0]:=b[0];
     aab[2,1]:=b[1];
     aab[2,2]:=b[2];
     aab[2,3]:=b[3];
     aab[2,4]:=b[4];
     s3:=determinant();

     for i:=0 to m-1 do
      for j:=0 to m-1 do
        aab[i,j]:=aap[i,j];

     aab[3,0]:=b[0];
     aab[3,1]:=b[1];
     aab[3,2]:=b[2];
     aab[3,3]:=b[3];
     aab[3,4]:=b[4];
     s4:=determinant();

     for i:=0 to m-1 do
      for j:=0 to m-1 do
        aab[i,j]:=aap[i,j];

     aab[4,0]:=b[0];
     aab[4,1]:=b[1];
     aab[4,2]:=b[2];
     aab[4,3]:=b[3];
     aab[4,4]:=b[3];
     s5:=determinant();

     s1:=s1/sO;
     s2:=s2/sO;
     s3:=s3/sO;
     s4:=s4/sO;
     s5:=s5/sO;

     e[0]:=s1;
     e[1]:=s2;
     e[2]:=s3;
     e[3]:=s4;
     e[4]:=s5;

     SG4.Cells[0,0]:=floattostr(s1);
     SG4.Cells[0,1]:=floattostr(s2);
     SG4.Cells[0,2]:=floattostr(s3);
     SG4.Cells[0,3]:=floattostr(s4);
     SG4.Cells[0,4]:=floattostr(s5);

    end;
    //Матрица 5x5 Методом крамера. Конец.

   //Метод Крамера. Конец.


    for i:=0 to m-1 do
      for j:=0 to m-1 do
        begin
          sum:=0;
          for k:=0 to m-1 do
            sum:=sum+a[i,k]*e[k];
          u[i]:=sum;
        end;
    for i:=0 to m-1 do
      for j:=0 to m-1 do
        SG5.Cells[j,i]:=floattostr(u[i]);
end;
  end;
end;
end;

procedure TForm1.SG1KeyPress(Sender: TObject; var Key: Char);
begin
Float(Key);
end;

procedure TForm1.Sg2KeyPress(Sender: TObject; var Key: Char);
begin
Float(Key);
end;

procedure TForm1.EditKeyPress(Sender: TObject; var Key: Char);
begin
Float2(Key);
end;

procedure TForm1.ZapisClick(Sender: TObject);
var
h:TextFile;
i,j,cola,colb:integer;
begin
  if SaveDialog.Execute then
  begin
  Form1.click;
  assignfile(h, SaveDialog.FileName);
  rewrite(h);
  write(h, Edit.text+' '+Edit.text);
  writeln(h);
  cola:=strtoint(Edit.text);
  for i:=1 to cola do
    begin
    for j:=1 to cola do
    write(h, SG1.cells[j,i], ' ');
    writeln(h);
    end;
  write(h, Edit.Text);
  writeln(h);
  colb:=strtoint(Edit.text);
  for i:=1 to colb do
    begin
    for j:=1 to colb do
    write(h, SG2.cells[j,i], ' ');
    writeln(h);
    end;
  closefile(h);
  Count.Click;
  end;
end;

procedure TForm1.ChtenieClick(Sender: TObject);
var
h: TextFile;
n,m,i,j,rowa,rowb,l:integer;
s: string;
begin
  if OpenDialog.Execute then
  begin
  VVod.Click;
  assignfile(h, OpenDialog.Filename);
  reset(h);
  readln(h,n,m);
  Edit.Text:=inttostr(n);
  SG1.RowCount:=n+1;
  SG1.ColCount:=m+1;
  j:=0;
  rowa:=strtoint(Edit.text);
  for i:=1 to rowa do
    begin
    readln(h, s);
    for l:=1 to length(s) do
    if s[l]='.' then
    s[l]:=',';
    for m:=1 to rowa do
    if pos(' ', s)<>0 then
      begin
      n:=pos(' ', s);
      SG1.cells[m, j+1]:=copy(s, 1, n-1);
      delete(s, 1, n);
    end;
    inc(j);
  end;
  readln(h,n);
  SG2.RowCount:=n+1;
  j:=0;
  rowb:=strtoint(Edit.text);
  for i:=1 to rowb do
    begin
    readln(h,s);
    for l:=1 to length(s) do
    if s[l]='.' then
    s[l]:=',';
    for m:=1 to rowb do
    if pos(' ', s)<>0 then
      begin
      n:=pos(' ', s);
      SG2.cells[m, j+1]:=copy(s, 1, n-1);
      delete(s, 1, n);
      end;
    inc(j);
    end;
    readln(h, n);
    Form1.Click;
    Count.Click;
    closefile(h);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
s1:=0;
s2:=0;
s3:=0;
s4:=0;
s5:=0;
s6:=0;
sd:=1;
end;

end.
