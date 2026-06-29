#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IMEWRD.ahk" { IMEWRD }
#Import ".\IMEUCT.ahk" { IMEUCT }
#Import ".\IMEREL.ahk" { IMEREL }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMEDP {
    #StructPack 8

    wrdModifier : IMEWRD

    wrdModifiee : IMEWRD

    relID : IMEREL

}
