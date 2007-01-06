--- status: TODO
--- author(s): 
--- notes: 

document { 
     Key => kernel,
     Headline => "kernel of a ringmap, matrix, or chain complex",
     }

document { 
     Key => (kernel,RingMap),
     Headline => "kernel of a ringmap",
     Usage => "kernel f",
     Inputs => {
	  "f" => {TT "R", " --> ", TT "S"},
	  SubringLimit => ZZ => "stop the computation after this many elements of the kernel have been found"
	  },
     Outputs => {
	  Ideal => {"an ideal of ", TT "R"}
	  },
     EXAMPLE lines ///
	  R = QQ[a..d];
	  S = QQ[s,t];
	  F = map(S,R,{s^3, s^2*t, s*t^2, t^3})
	  ker F
	  G = map(S,R,{s^5, s^3*t^2-t, s*t-s, t^5})
	  ker(G, SubringLimit=>1)
	  ///,
     "In the case when everything is homogeneous, Hilbert functions are
     used to speed up the computations.",
     Caveat => {"It should be possible to interrupt the computation and restart it, but this has
	  not yet been implemented."},
     SeeAlso => {"substitution and maps between rings", "elimination of variables", monomialCurveIdeal}
     }
document { 
     Key => {(kernel,ChainComplexMap),
	  (kernel, GradedModuleMap)},
     Headline => "kernel of a chain complex map",
     Usage => "kernel f",
     Inputs => {
	  "f" => {"a map of chain complexes ", TT "C --> D"}
	  },
     Outputs => {
	  ChainComplex => {"the kernel of f"}
	  },
     "If f is ", ofClass GradedModuleMap, ", then the result will be ", ofClass GradedModule, ".",
     PARA{},
     EXAMPLE lines ///
     	  R = QQ[a..d]
	  I = ideal(a^3,b^3,c^3)
	  C = res coker gens I
	  D = res coker gens (I + ideal(a*b*c))
	  F = extend(D,C,map(D_0,C_0,1))
	  ///,
     SeeAlso => {syz, "kernel, cokernel and image of a map of modules", genericSkewMatrix}
     }

document { 
     Key => {(kernel,Matrix),
	  (kernel, RingElement)},
     Headline => "kernel of a matrix",
     Usage => "kernel f",
     Inputs => {
	  "f" => {"a map of modules ", TT "M --> N"}
	  },
     Outputs => {
	  Module => {"the kernel of f, a submodule of M"}
	  },
     "If f is ", ofClass RingElement, ", then it will be interpreted as a one by one matrix.",
     PARA{},
     "The kernel is the submodule of M of all elements mapping to zero under ", TT "f", ".
     Over polynomial rings, this is computed using a Groebner basis computation.",
     EXAMPLE lines ///
     	  R = ZZ/32003[vars(0..10)]
	  M = genericSkewMatrix(R,a,5)
	  ker M
	  ///,
     SeeAlso => {syz, "kernel, cokernel and image of a map of modules", genericSkewMatrix}
     }
 -- doc1.m2:674:     Key => symbol cokernel,
 -- doc7.m2:1397:     Key => kernel,
 -- doc7.m2:1413:     Key => [kernel,SubringLimit],
 -- overviewB.m2:765:     Key => "kernel and image of a ring map",
 -- overviewC.m2:1308:     Key => "kernel, cokernel and image of a map of modules",
