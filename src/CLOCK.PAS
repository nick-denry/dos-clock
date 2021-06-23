Unit CLOCK;
Interface

  uses CL_BRAND, DOS, Graph, GR_HELP, TPCRT;

  var
    {All radiuses is in pixels}
    clockRadius, longBarRadius, shortBarRadius: Integer;
    screenCenter: TScreenCenter;
    Xasp, Yasp: Word;

  procedure DrawClock;

Implementation

  procedure DrawClockCircle;
  begin
    screenCenter := getScreenCenter^;
    GetAspectRatio(Xasp, Yasp);
    clockRadius := round(3 * GetMaxY / 8);
    longBarRadius := round(0.9 * clockRadius);
    shortBarRadius := round(0.95 * clockRadius);
    Circle(screenCenter.x, screenCenter.y, clockRadius);
    SetLineStyle (SolidLN, 0, ThickWidth);
    Circle(screenCenter.x, screenCenter.y, round(clockRadius*1.04));
  end;

  procedure DrawClockBars;
  var
    bar, barRadius, startX, endX, startY, endY: Integer;
  begin
    SetLineStyle (SolidLN, 0, NormWidth);
    for bar := 0 to 59 do
      begin
        if bar mod 5=0 then
          barRadius := longBarRadius
        else
          barRadius := shortBarRadius;
          startX := screenCenter.x + round(barRadius * sin(2 * pi * bar / 60));
          startY := screenCenter.y - round(barRadius * Xasp * cos(2 * pi * bar / 60) / Yasp);
          endX := screencenter.x + round(clockRadius * sin(2 * pi * bar / 60));
          endY := screenCenter.y - round(clockRadius * Xasp * cos(2 * pi * bar / 60) / Yasp);
          Line(startX, startY, endX, endY);
      end;
  end;

  procedure DrawClockHands;
  var
    hour, minute, second, sec100 : Word;
    hourEndX, hourEndY, minuteEndX, minuteEndY, secondEndX, secondEndY: Integer;
  begin
    SetWriteMode (XORPut); {Redraw hand lines after each tick.}
    Repeat
      {Get PC time}
      getTime(hour, minute, second, sec100);
      {Get each hand coords}
      hourEndX := screenCenter.x + round(0.75 * longBarRadius * sin(2 * pi * hour / 12));
      hourEndY := screenCenter.y - round(0.75 * longBarRadius * Xasp * cos(2 * pi * hour / 12) / Yasp);
      minuteEndX := screenCenter.x + round(0.94 * longBarRadius * sin(2 * pi * minute / 60));
      minuteEndY := screenCenter.y - round(0.94 * longBarRadius * Xasp * cos(2 * pi * minute / 60) / Yasp);
      secondEndX := screenCenter.x + round(0.98 * longBarRadius * sin(2 * pi * second / 60));
      secondEndY := screenCenter.y - round(0.98 * longBarRadius * Xasp*cos(2 * pi * second / 60) / Yasp);
      {Draw hands.}
      SetLineStyle (SolidLN, 0, ThickWidth);
      Line (screenCenter.x, screenCenter.y, hourEndX, hourEndY);
      Line (screenCenter.x, screenCenter.y, minuteEndX, minuteEndY);
      SetLineStyle (SolidLN, 0, NormWidth);
      Line (screenCenter.x, screenCenter.y, secondEndX, secondEndY);
      delay(990);
      Line (screenCenter.x, screenCenter.y, secondEndX, secondEndY);
      SetLineStyle (SolidLN, 0, ThickWidth);
      Line (screenCenter.x, screenCenter.y, minuteEndX, minuteEndY);
      Line (screenCenter.x, screenCenter.y, hourEndX, hourEndY);
    until KeyPressed;
  end;

  procedure DrawClock;
  begin
    DisplayBrand;
    DisplayMadeIn;
    DrawClockCircle;
    DrawClockBars;
    DrawClockHands;
  end;

End.
