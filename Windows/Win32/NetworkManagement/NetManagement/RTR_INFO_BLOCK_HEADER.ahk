#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RTR_TOC_ENTRY.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class RTR_INFO_BLOCK_HEADER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    TocEntriesCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<RTR_TOC_ENTRY>}
     */
    TocEntry{
        get {
            if(!this.HasProp("__TocEntryProxyArray"))
                this.__TocEntryProxyArray := Win32FixedArray(this.ptr + 16, 1, RTR_TOC_ENTRY, "")
            return this.__TocEntryProxyArray
        }
    }
}
