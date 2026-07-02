#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMEUCT.ahk" { IMEUCT }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IMEREL.ahk" { IMEREL }
#Import ".\IMEWRD.ahk" { IMEWRD }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMEDP {
    #StructPack 8

    wrdModifier : IMEWRD

    wrdModifiee : IMEWRD

    relID : IMEREL

}
