#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class STORAGE_SET_READ_AHEAD extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * @type {Integer}
     */
    TriggerAddress {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TargetAddress {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
