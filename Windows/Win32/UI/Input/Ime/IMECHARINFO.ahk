#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMECHARINFO {
    #StructPack 4

    wch : Int8

    dwCharInfo : UInt32

}
