#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_AC3_ERROR_CONCEALMENT extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    fRepeatPreviousBlock {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    fErrorInCurrentBlock {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
