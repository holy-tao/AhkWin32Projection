#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMEKMSKEY.ahk" { IMEKMSKEY }
#Import ".\HIMC.ahk" { HIMC }

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
