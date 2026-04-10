#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
class KEYBOARD_ID extends Win32Struct {
    static sizeof => 2

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Subtype {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }
}
