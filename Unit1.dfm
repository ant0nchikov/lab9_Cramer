object Form1: TForm1
  Left = 245
  Top = 200
  Width = 972
  Height = 337
  Caption = #1057#1051#1040#1059' - ant0nchikov.pro'
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClick = FormClick
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object Isxodnaya: TLabel
    Left = 13
    Top = 5
    Width = 157
    Height = 20
    Caption = #1048#1089#1093#1086#1076#1085#1072#1103' '#1084#1072#1090#1088#1080#1094#1072' '#1040
    Visible = False
  end
  object Vektor: TLabel
    Left = 229
    Top = 8
    Width = 70
    Height = 20
    Caption = #1042#1077#1082#1090#1086#1088' '#1042
    Visible = False
  end
  object Razmernost: TLabel
    Left = 456
    Top = 37
    Width = 169
    Height = 20
    AutoSize = False
    Caption = #1056#1072#1079#1084#1077#1088#1086#1089#1090#1100' '#1084#1072#1090#1088#1080#1094#1099
    Visible = False
    WordWrap = True
  end
  object Metod: TLabel
    Left = 464
    Top = 122
    Width = 147
    Height = 20
    Caption = #1052#1077#1090#1086#1076' '#1074#1099#1095#1080#1089#1083#1077#1085#1080#1103
    Visible = False
  end
  object SG1: TStringGrid
    Left = 13
    Top = 30
    Width = 204
    Height = 203
    ColCount = 1
    DefaultColWidth = 30
    DefaultRowHeight = 30
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
    TabOrder = 0
    Visible = False
    OnKeyPress = SG1KeyPress
  end
  object Sg2: TStringGrid
    Left = 229
    Top = 32
    Width = 204
    Height = 201
    ColCount = 1
    DefaultColWidth = 25
    DefaultRowHeight = 25
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
    TabOrder = 1
    Visible = False
    OnKeyPress = Sg2KeyPress
  end
  object Edit: TEdit
    Left = 462
    Top = 67
    Width = 139
    Height = 28
    TabOrder = 2
    Text = '0'
    Visible = False
    OnKeyPress = EditKeyPress
  end
  object UpDown: TUpDown
    Left = 601
    Top = 67
    Width = 16
    Height = 28
    Associate = Edit
    TabOrder = 3
    Visible = False
  end
  object Count: TButton
    Left = 200
    Top = 250
    Width = 169
    Height = 39
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
    TabOrder = 4
    OnClick = CountClick
  end
  object Close: TBitBtn
    Left = 760
    Top = 248
    Width = 177
    Height = 41
    TabOrder = 5
    Kind = bkClose
  end
  object ComboBox: TComboBox
    Left = 464
    Top = 155
    Width = 153
    Height = 28
    Style = csDropDownList
    ItemHeight = 20
    TabOrder = 6
    Visible = False
    Items.Strings = (
      #1041#1083#1086#1095#1085#1099#1081' '#1084#1077#1090#1086#1076
      #1052#1077#1090#1086#1076' '#1050#1088#1072#1084#1077#1088#1072)
  end
  object Vvod: TButton
    Left = 10
    Top = 251
    Width = 167
    Height = 38
    Caption = #1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093
    TabOrder = 7
    OnClick = VvodClick
  end
  object Zapis: TButton
    Left = 386
    Top = 248
    Width = 167
    Height = 41
    Caption = #1047#1072#1087#1080#1089#1100' '#1074' '#1092#1072#1081#1083
    TabOrder = 8
    OnClick = ZapisClick
  end
  object Chtenie: TButton
    Left = 570
    Top = 248
    Width = 167
    Height = 41
    Caption = #1063#1090#1077#1085#1080#1077' '#1080#1079' '#1092#1072#1081#1083#1072
    TabOrder = 9
    OnClick = ChtenieClick
  end
  object PageControl: TPageControl
    Left = 630
    Top = 8
    Width = 307
    Height = 225
    ActivePage = TabSheet3
    MultiLine = True
    TabOrder = 10
    Visible = False
    object TabSheet1: TTabSheet
      Caption = #1041#1083#1086#1095#1085#1099#1081' '#1084#1077#1090#1086#1076
      object Sg3: TStringGrid
        Left = 8
        Top = 8
        Width = 281
        Height = 145
        ColCount = 1
        DefaultColWidth = 30
        DefaultRowHeight = 30
        FixedCols = 0
        RowCount = 2
        FixedRows = 0
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1052#1077#1090#1086#1076' '#1050#1088#1072#1084#1077#1088#1072
      ImageIndex = 1
      object SG4: TStringGrid
        Left = 8
        Top = 8
        Width = 281
        Height = 145
        ColCount = 1
        DefaultColWidth = 50
        DefaultRowHeight = 30
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072
      ImageIndex = 2
      object SG5: TStringGrid
        Left = 8
        Top = 8
        Width = 281
        Height = 145
        ColCount = 1
        DefaultColWidth = 30
        DefaultRowHeight = 30
        FixedCols = 0
        RowCount = 2
        FixedRows = 0
        TabOrder = 0
      end
    end
  end
  object OpenDialog: TOpenDialog
    Left = 536
    Top = 8
  end
  object SaveDialog: TSaveDialog
    Left = 504
    Top = 8
  end
end
