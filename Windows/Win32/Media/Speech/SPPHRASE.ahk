#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SPPHRASEELEMENT.ahk" { SPPHRASEELEMENT }
#Import ".\SPPHRASEPROPERTY.ahk" { SPPHRASEPROPERTY }
#Import ".\SPPHRASEREPLACEMENT.ahk" { SPPHRASEREPLACEMENT }
#Import ".\SPPHRASERULE.ahk" { SPPHRASERULE }
#Import ".\SPPHRASE_50.ahk" { SPPHRASE_50 }
#Import ".\SPSEMANTICERRORINFO.ahk" { SPSEMANTICERRORINFO }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPPHRASE {
    #StructPack 8

    Base : SPPHRASE_50

    pSML : PWSTR

    pSemanticErrorInfo : SPSEMANTICERRORINFO.Ptr

}
