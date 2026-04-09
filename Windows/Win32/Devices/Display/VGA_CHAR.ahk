#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class VGA_CHAR extends Win32Struct {
    static sizeof => 2

    static packingSize => 1

    /**
     * @type {CHAR}
     */
    Char {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {CHAR}
     */
    Attributes {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }
}
