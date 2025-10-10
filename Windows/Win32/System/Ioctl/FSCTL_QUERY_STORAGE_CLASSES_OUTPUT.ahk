#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FILE_STORAGE_TIER.ahk

/**
 * Contains information for all tiers of a specific volume.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-fsctl_query_storage_classes_output
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FSCTL_QUERY_STORAGE_CLASSES_OUTPUT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size of this structure serves as the version.  Set it to <b>sizeof</b>(<b>FSCTL_QUERY_STORAGE_CLASSES_OUTPUT</b>).
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of this structure plus all the variable sized fields.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Total number of available tiers for this disk.
     * @type {Integer}
     */
    TotalNumberOfTiers {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Number of tiers that fit in the output.
     * @type {Integer}
     */
    NumberOfTiersReturned {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-file_storage_tier">FILE_STORAGE_TIER</a> structure that contains detailed info on the storage tiers.
     * @type {Array<FILE_STORAGE_TIER>}
     */
    Tiers{
        get {
            if(!this.HasProp("__TiersProxyArray"))
                this.__TiersProxyArray := Win32FixedArray(this.ptr + 24, 1, FILE_STORAGE_TIER, "")
            return this.__TiersProxyArray
        }
    }
}
