BeginPackage["ChristopherWolfram`ViennaRNALink`RNAFold`"];

Begin["`Private`"];

Needs["ChristopherWolfram`ViennaRNALink`"]
Needs["ChristopherWolfram`ViennaRNALink`General`"]
Needs["ChristopherWolfram`ViennaRNALink`Utilities`"]



vrnaFoldC := vrnaFoldC =
	ForeignFunctionLoad[$LibViennaRNA, "vrna_fold", {"RawPointer"::["UnsignedInteger8"], "RawPointer"::["UnsignedInteger8"]} -> "CFloat"];

vrnaFold[seqStr_] :=
	Module[{structure, mfe, structureString},
		structure = RawPointer[ViennaRNAAllocate[StringLength[seqStr] + 1], "UnsignedInteger8"];
		mfe = vrnaFoldC[seqStr, structure];
		structureString = RawMemoryImport[structure, "String"];
		<|
			"MinimumFreeEnergy" -> Quantity[mfe, "ThermochemicalKilocalories"/"Moles"],
			"StructureString" -> structureString
		|>
	]


getFoldProperty[seqStr_, fold_, "MinimumFreeEnergy"] := fold["MinimumFreeEnergy"]
getFoldProperty[seqStr_, fold_, "StructureString"] := fold["StructureString"]
getFoldProperty[seqStr_, fold_, "BioSequence"] := BioSequence["RNA", seqStr, fold["StructureString"]]
getFoldProperty[seqStr_, fold_, other_] := Missing["KeyAbsent", other]

getFoldProperty[seqStr_, fold_, All] :=
	AssociationMap[
		getFoldProperty[seqStr, fold, #]&,
		{"MinimumFreeEnergy", "StructureString", "BioSequence"}
	]


DeclareFunction[RNAFold, iRNAFold, {1,2}];

iRNAFold[seqStr_?StringQ, prop_, opts_] :=
	getFoldProperty[seqStr, vrnaFold[seqStr], prop]

iRNAFold[seq_?(BioSequenceQ[#,"RNA"]&), prop_, opts_] :=
	iRNAFold[seq["SequenceString"], prop, opts]

iRNAFold[seq_, opts_] :=
	iRNAFold[seq, "BioSequence", opts]


End[];
EndPackage[];
