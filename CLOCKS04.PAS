Program Clocks04;

Uses GRAPH, GR_INIT, CLOCK;

Begin
  {Init vga graphics}
  InitGraphLib;
  {Draw clock itself}
  DrawClock;
  {Free graph driver}
  CloseGraph;
end.



