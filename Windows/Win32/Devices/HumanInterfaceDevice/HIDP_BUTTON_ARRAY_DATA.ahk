#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
class HIDP_BUTTON_ARRAY_DATA extends Win32Struct {
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Integer}
     */
    ArrayIndex {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    On {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }
}
