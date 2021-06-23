unit GR_INIT;
interface
uses GRAPH, TPCRT;

  procedure registerGraphDriver;
  procedure InitGraphLib;

implementation

  Procedure egvgdrv; external;
  {$L egavga.obj}

  procedure registerGraphDriver;
  begin
    if RegisterBGIDriver(@egvgdrv) < 0 then
      begin
        WriteLN('EGVGA registration error');
        halt
      end;
  end;

  procedure InitGraphLib;
  var
    graphDriver, mode, graphInitResult : Integer; {Graph related vars}
  begin
    registerGraphDriver;
    graphDriver := Detect;
    InitGraph(graphDriver, mode, '');
    graphInitResult := GraphResult;
    if graphInitResult <> grOK then
      begin
        Writeln (GraphErrorMSG(graphInitResult));
        halt;
      end;
  end;

end.
