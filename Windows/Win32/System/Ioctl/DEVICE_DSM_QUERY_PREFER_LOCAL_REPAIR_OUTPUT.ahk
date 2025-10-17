#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_DSM_QUERY_PREFER_LOCAL_REPAIR_OUTPUT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    PreferLocalRepair {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }
}
