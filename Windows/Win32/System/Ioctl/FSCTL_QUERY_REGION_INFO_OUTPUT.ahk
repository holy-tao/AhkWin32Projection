#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FILE_STORAGE_TIER_REGION.ahk

/**
 * Contains information for one or more regions.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-fsctl_query_region_info_output
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FSCTL_QUERY_REGION_INFO_OUTPUT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size of this structure serves as the version.  Set it to <b>sizeof</b>(<b>FSCTL_QUERY_REGION_INFO_OUTPUT</b>).
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of this structure in bytes.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Offset from the beginning of the volume to the first slab of the tiered volume. If the logical disk is made up of multiple tiers and each tier maps to a set of regions then the first tier for the volume contained on the logical disk has a certain offset within the tier that represents the offset of the volume on the logical disk.  The <b>Alignment</b> member contains this value.
     * @type {Integer}
     */
    Alignment {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Total number of available regions.
     * @type {Integer}
     */
    TotalNumberOfRegions {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Number of regions that fit in the output.
     * @type {Integer}
     */
    NumberOfRegionsReturned {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-file_storage_tier_region">FILE_STORAGE_TIER_REGION</a> struct that contains detailed information for each region.
     * @type {Array<FILE_STORAGE_TIER_REGION>}
     */
    Regions{
        get {
            if(!this.HasProp("__RegionsProxyArray"))
                this.__RegionsProxyArray := Win32FixedArray(this.ptr + 32, 8, FILE_STORAGE_TIER_REGION, "")
            return this.__RegionsProxyArray
        }
    }
}
