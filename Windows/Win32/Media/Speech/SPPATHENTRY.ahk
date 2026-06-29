#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPTRANSITIONID.ahk" { SPTRANSITIONID }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SPPHRASEELEMENT.ahk" { SPPHRASEELEMENT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPPATHENTRY {
    #StructPack 8

    hTransition : SPTRANSITIONID

    elem : SPPHRASEELEMENT

}
