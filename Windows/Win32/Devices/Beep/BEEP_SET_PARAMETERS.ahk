#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Beep
 * @version v4.0.30319
 */
class BEEP_SET_PARAMETERS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Frequency {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Duration {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
