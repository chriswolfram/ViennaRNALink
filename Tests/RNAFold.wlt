res = BioSequence["RNA", "GAGUAGUGGAACCAGGCUAUGUUUGUGACUCGCAGACUAACA", {
		Bond[{7, 16}], 
		Bond[{6, 17}], 
		Bond[{5, 18}], 
		Bond[{4, 19}], 
		Bond[{3, 20}], 
		Bond[{27, 31}], 
		Bond[{26, 32}], 
		Bond[{25, 33}], 
		Bond[{24, 34}], 
		Bond[{23, 35}], 
		Bond[{22, 36}], 
		Bond[{21, 37}]
	}];

TestCreate[
	RNAFold["GAGUAGUGGAACCAGGCUAUGUUUGUGACUCGCAGACUAACA"]
	,
	res
	,
	TestID -> "ViennaRNA-RNAFold-1"
]

TestCreate[
	RNAFold["GAGUAGUGGAACCAGGCUAUGUUUGUGACUCGCAGACUAACA", "BioSequence"]
	,
	res
	,
	TestID -> "ViennaRNA-RNAFold-2"
]

TestCreate[
	RNAFold[BioSequence["RNA", "GAGUAGUGGAACCAGGCUAUGUUUGUGACUCGCAGACUAACA"]]
	,
	res
	,
	TestID -> "ViennaRNA-RNAFold-3"
]

TestCreate[
	RNAFold[BioSequence["RNA", "GAGUAGUGGAACCAGGCUAUGUUUGUGACUCGCAGACUAACA"], "BioSequence"]
	,
	res
	,
	TestID -> "ViennaRNA-RNAFold-4"
]

TestCreate[
	RNAFold["GAGUAGUGGAACCAGGCUAUGUUUGUGACUCGCAGACUAACA", "StructureString"]
	,
	"..(((((........)))))(((((((...)))))))....."
	,
	TestID -> "ViennaRNA-RNAFold-5"
]

TestCreate[
	MatchQ[RNAFold["GAGUAGUGGAACCAGGCUAUGUUUGUGACUCGCAGACUAACA", "MinimumFreeEnergy"], _Quantity]
	,
	TestID -> "ViennaRNA-RNAFold-6"
]

TestCreate[
	FailureQ@RNAFold[BioSequence["DNA", "GAGUAGUGGAACCAGGCUAUGUUUGUGACUCGCAGACUAACA"]]
	,
	True
	,
	TestID -> "ViennaRNA-RNAFold-7"
]