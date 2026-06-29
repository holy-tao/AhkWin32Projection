#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPPHRASEELEMENT.ahk" { SPPHRASEELEMENT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SPPHRASERULE.ahk" { SPPHRASERULE }
#Import ".\SPSEMANTICERRORINFO.ahk" { SPSEMANTICERRORINFO }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPPHRASE_50.ahk" { SPPHRASE_50 }
#Import ".\SPPHRASEREPLACEMENT.ahk" { SPPHRASEREPLACEMENT }
#Import ".\SPPHRASEPROPERTY.ahk" { SPPHRASEPROPERTY }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPPHRASE {
    #StructPack 8

    Base : SPPHRASE_50

    pSML : PWSTR

    pSemanticErrorInfo : SPSEMANTICERRORINFO.Ptr

}
