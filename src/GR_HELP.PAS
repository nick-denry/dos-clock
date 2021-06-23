Unit GR_HELP;

Interface

  Uses Graph;

  type
    PScreenCenter = ^TScreenCenter;
    TScreenCenter = record
      x, y : Integer;
    end;

  var
    screenCenter : TScreenCenter;

  function getScreenCenter: PScreenCenter;
  procedure hDrawText(text: String; fontType, fontSize, yShift: Integer);

Implementation

  function getScreenCenter: PScreenCenter;
  begin
    {ScreenCenter := New(PScreenCenter);}
    ScreenCenter.x := (GetMaxX + 1) div 2;
    ScreenCenter.y := (GetMaxY + 1) div 2;
    getScreenCenter := @ScreenCenter;
  end;

  procedure hDrawText(text: String; fontType, fontSize, yShift: integer);
  var
    screenCenter: TScreenCenter;
    textScrWidth: Word;
  begin
    screenCenter := getScreenCenter^;
    SetTextStyle (fontType, HorizDir, fontSize); {@see docs, 5 is font size}
    textScrWidth := TextWidth(text) div 2;
    OutTextXY(screenCenter.x - textScrWidth, screenCenter.y + yShift, text);
  end;

End.