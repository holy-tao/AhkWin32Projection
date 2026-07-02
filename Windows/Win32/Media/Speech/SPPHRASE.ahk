#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPPHRASEPROPERTY.ahk" { SPPHRASEPROPERTY }
#Import ".\SPPHRASERULE.ahk" { SPPHRASERULE }
#Import ".\SPPHRASEREPLACEMENT.ahk" { SPPHRASEREPLACEMENT }
#Import ".\SPPHRASE_50.ahk" { SPPHRASE_50 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SPPHRASEELEMENT.ahk" { SPPHRASEELEMENT }
#Import ".\SPSEMANTICERRORINFO.ahk" { SPSEMANTICERRORINFO }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPPHRASE {
    #StructPack 8

    Base : SPPHRASE_50

    pSML : PWSTR

    pSemanticErrorInfo : SPSEMANTICERRORINFO.Ptr

}
