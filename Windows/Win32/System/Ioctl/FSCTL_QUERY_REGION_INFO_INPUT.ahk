#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the storage tier regions from the storage stack for a particular volume.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-fsctl_query_region_info_input
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FSCTL_QUERY_REGION_INFO_INPUT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size of this structure serves as the version.  Set it to <b>sizeof</b>(<b>FSCTL_QUERY_REGION_INFO_INPUT</b>).
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
     * Number of entries in <b>TierIds</b>, 0 to request IDs for the entire volume.
     * @type {Integer}
     */
    NumberOfTierIds {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Array of storage tiers (represented by GUID values) for which to return information.
     * @type {Array<Guid>}
     */
    TierIds{
        get {
            if(!this.HasProp("__TierIdsProxyArray"))
                this.__TierIdsProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "ptr")
            return this.__TierIdsProxyArray
        }
    }
}
