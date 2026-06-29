#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the storage tier regions from the storage stack for a particular volume.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-fsctl_query_region_info_input
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FSCTL_QUERY_REGION_INFO_INPUT {
    #StructPack 8

    /**
     * The size of this structure serves as the version.  Set it to <b>sizeof</b>(<b>FSCTL_QUERY_REGION_INFO_INPUT</b>).
     */
    Version : UInt32

    /**
     * The size of this structure in bytes.
     */
    Size : UInt32

    /**
     * Reserved for future use.
     */
    Flags : UInt32

    /**
     * Number of entries in <b>TierIds</b>, 0 to request IDs for the entire volume.
     */
    NumberOfTierIds : UInt32

    /**
     * Array of storage tiers (represented by GUID values) for which to return information.
     */
    TierIds : IntPtr[1]

}
