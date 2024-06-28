BeginPackage["ChristopherWolfram`ViennaRNALink`General`"];

ViennaRNAAllocate

Begin["`Private`"];

Needs["ChristopherWolfram`ViennaRNALink`"]
Needs["ChristopherWolfram`ViennaRNALink`Utilities`"]


vrnaAllocC := vrnaAllocC =
	ForeignFunctionLoad[$LibViennaRNA, "vrna_alloc", {"CUnsignedInt"} -> "OpaqueRawPointer"];

vrnaFreeC := vrnaFreeC =
	ForeignFunctionLoad[$LibViennaRNA, "free", {"OpaqueRawPointer"} -> "Void"];


DeclareFunction[ViennaRNAAllocate, iViennaRNAAllocate, 1];

iViennaRNAAllocate[len_Integer, opts_] := CreateManagedObject[vrnaAllocC[len], vrnaFreeC]


End[];
EndPackage[];
