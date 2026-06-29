#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HIMC.ahk" { HIMC }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMEKMSINVK {
    #StructPack 8

    cbSize : Int32 := this.Size

    hIMC : HIMC

    dwControl : UInt32

}
