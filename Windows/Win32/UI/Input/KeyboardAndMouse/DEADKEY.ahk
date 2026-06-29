#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct DEADKEY {
    #StructPack 4

    dwBoth : UInt32

    wchComposed : Int8

    uFlags : UInt16

}
