#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SD_ENUM_SDS_ENTRY.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SD_ENUM_SDS_OUTPUT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NextOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumSDEntriesReturned {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumSDBytesReturned {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<SD_ENUM_SDS_ENTRY>}
     */
    SDEntry{
        get {
            if(!this.HasProp("__SDEntryProxyArray"))
                this.__SDEntryProxyArray := Win32FixedArray(this.ptr + 24, 1, SD_ENUM_SDS_ENTRY, "")
            return this.__SDEntryProxyArray
        }
    }
}
