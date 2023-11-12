(* ::Package:: *)

MonteCarloPi[n_Integer] := 
 Module[{to\[CHacek]ke, vkrogu, aproksimacija, graf},
  to\[CHacek]ke = RandomReal[{-1, 1}, {n, 2}];
  vkrogu = Select[to\[CHacek]ke, Norm[#] <= 1 &];
  aproksimacija = 4 Length[vkrogu]/n;
  
  (* Izris grafa *)
  graf = ListPlot[{
     to\[CHacek]ke,
     vkrogu
     },
    PlotStyle -> {
      {Red, PointSize[0.02]}, 
      {Green, PointSize[0.02]}
      },
    AspectRatio -> 1,
    Epilog -> {
      Blue, Circle[{0, 0}, 1],
      Dashed, Line[{{-1, 0}, {1, 0}}], Line[{{0, -1}, {0, 1}}],
      Text["(-1,0)", {-1, -0.2}], Text["(1,0)", {1, -0.2}],
      Text["(0,-1)", {-0.2, -1}], Text["(0,1)", {-0.2, 1}],
      
      PointSize[0.02], 
      Point[{1.8, 1.1}], (* Legenda za krog *)
      Point[{1.8, 1.0}], (* Legenda za kvadrat *)
      Text["Circle", {1.9, 1.1}],
      Text["Square", {1.9, 1.0}]
      },
    Frame -> True,
    PlotLabel -> "Aproksimacija \[SHacek]tevila \[Pi] "
    ];
  Print[graf];
  Piaproks=N[aproksimacija];
  Print[StringForm["\!\(\*SubscriptBox[\(\[Pi]\), \(aproksimacija\)]\)=``",Piaproks]];
  ]

