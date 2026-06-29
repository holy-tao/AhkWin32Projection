#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HIMC.ahk" { HIMC }
#Import ".\IMEKMSKEY.ahk" { IMEKMSKEY }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMEKMSKMP {
    #StructPack 8

    cbSize : Int32 := this.Size

    hIMC : HIMC

    idLang : UInt16

    wVKStart : UInt16

    wVKEnd : UInt16

    cKeyList : Int32

    pKeyList : IMEKMSKEY.Ptr

}
