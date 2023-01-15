object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'TBlend2DPaintBox for VCL'
  ClientHeight = 668
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Tahoma'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 144
  TextHeight = 21
  object PanelSettings: TPanel
    Left = 0
    Top = 0
    Width = 653
    Height = 50
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object CheckBoxLowRes: TCheckBox
      AlignWithMargins = True
      Left = 60
      Top = 24
      Width = 593
      Height = 26
      Margins.Left = 60
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alBottom
      Caption = 'Low Resolution (on high-DPI displays)'
      TabOrder = 0
      OnClick = CheckBoxLowResClick
    end
  end
  object GridPanel: TGridPanel
    Left = 0
    Top = 50
    Width = 653
    Height = 618
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    BevelOuter = bvNone
    ColumnCollection = <
      item
        SizeStyle = ssAbsolute
        Value = 60.000000000000000000
      end
      item
        Value = 100.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 60.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 1
        Control = TrackBarX
        Row = 0
      end
      item
        Column = 0
        Control = TrackBarY
        Row = 1
      end
      item
        Column = 2
        Control = TrackBarZoom
        Row = 1
      end
      item
        Column = 1
        Control = TrackBarRotate
        Row = 2
      end
      item
        Column = 1
        Control = Blend2DPaintBox
        Row = 1
      end>
    RowCollection = <
      item
        SizeStyle = ssAbsolute
        Value = 60.000000000000000000
      end
      item
        Value = 100.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 60.000000000000000000
      end>
    TabOrder = 1
    object TrackBarX: TTrackBar
      Left = 60
      Top = 23
      Width = 533
      Height = 37
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alBottom
      Max = 240
      ShowSelRange = False
      TabOrder = 0
      ThumbLength = 30
      TickStyle = tsNone
      OnChange = TrackBarChange
    end
    object TrackBarY: TTrackBar
      Left = 23
      Top = 60
      Width = 37
      Height = 498
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      Max = 240
      Orientation = trVertical
      ShowSelRange = False
      TabOrder = 1
      ThumbLength = 30
      TickStyle = tsNone
      OnChange = TrackBarChange
    end
    object TrackBarZoom: TTrackBar
      Left = 593
      Top = 60
      Width = 37
      Height = 498
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Max = 500
      Min = 1
      Orientation = trVertical
      Position = 100
      ShowSelRange = False
      TabOrder = 2
      ThumbLength = 30
      TickMarks = tmTopLeft
      TickStyle = tsNone
      OnChange = TrackBarChange
    end
    object TrackBarRotate: TTrackBar
      Left = 60
      Top = 558
      Width = 533
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Max = 360
      Min = -360
      ShowSelRange = False
      TabOrder = 3
      ThumbLength = 30
      TickMarks = tmTopLeft
      TickStyle = tsNone
      OnChange = TrackBarChange
    end
    object Blend2DPaintBox: TBlend2DPaintBox
      Left = 60
      Top = 60
      Width = 533
      Height = 498
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      OnPaint = Blend2DPaintBoxPaint
    end
  end
end
