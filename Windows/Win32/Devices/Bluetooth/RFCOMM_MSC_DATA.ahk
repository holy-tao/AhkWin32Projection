#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class RFCOMM_MSC_DATA extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Signals {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Break {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }
}
