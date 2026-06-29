#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HIMC.ahk" { HIMC }
#Import ".\IMEKMSKEY.ahk" { IMEKMSKEY }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMEKMS {
    #StructPack 8

    cbSize : Int32 := this.Size

    hIMC : HIMC

    cKeyList : UInt32

    pKeyList : IMEKMSKEY.Ptr

}
