BeginPackage["ChristopherWolfram`ViennaRNALink`LibViennaRNA`"];

Begin["`Private`"];

Needs["ChristopherWolfram`ViennaRNALink`"]

$LibViennaRNA := $LibViennaRNA =
	FindLibrary@Switch[$SystemID,
		"Linux-x86-64",  "libRNA.so",
		"MacOSX-x86-64", "libRNA.dylib",
		"MacOSX-ARM64",  "libRNA.dylib",
		_, "libRNA"
	]

End[];
EndPackage[];
