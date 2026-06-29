#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct SOFTKBDDATA {
    #StructPack 4

    uCount : UInt32

    wCode : UInt16[256]

}
