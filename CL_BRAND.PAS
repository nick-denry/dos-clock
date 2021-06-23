Unit CL_BRAND;

Interface

  Uses Graph, GR_HELP;

  procedure DisplayBrand;
  procedure DisplayMadeIn;

Implementation

  procedure DisplayBrand;
  const
    Y_POSITION_SHIFT = 60; {Vertical position for brand set manually}
    TIMES_ITALIC = 7;
    WATCH_BRAND_NAME = 'Slava';
  begin
    hDrawText(WATCH_BRAND_NAME, TIMES_ITALIC, 5, Y_POSITION_SHIFT);
  end;

  procedure DisplayMadeIn;
  const
    Y_POSITION_SHIFT = 105; {Vertical position for brand set manually}
    MADE_IN = 'Made in USSR';
  begin
    hDrawText(MADE_IN, TriplexFont, 1, Y_POSITION_SHIFT);
  end;

End.