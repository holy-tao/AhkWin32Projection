#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class WIM_PROVIDER_REMOVE_OVERLAY_INPUT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Integer}
     */
    DataSourceId {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
