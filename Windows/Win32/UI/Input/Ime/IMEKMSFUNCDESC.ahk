#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMEKMSFUNCDESC {
    #StructPack 4

    cbSize : Int32 := this.Size

    idLang : UInt16

    dwControl : UInt32

    pwszDescription : WCHAR[128]

}
