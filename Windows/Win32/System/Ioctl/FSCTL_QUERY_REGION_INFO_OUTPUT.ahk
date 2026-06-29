#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_STORAGE_TIER_REGION.ahk" { FILE_STORAGE_TIER_REGION }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains information for one or more regions.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-fsctl_query_region_info_output
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FSCTL_QUERY_REGION_INFO_OUTPUT {
    #StructPack 8

    /**
     * The size of this structure serves as the version.  Set it to <b>sizeof</b>(<b>FSCTL_QUERY_REGION_INFO_OUTPUT</b>).
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
     * Reserved for future use.
     */
    Reserved : UInt32

    /**
     * Offset from the beginning of the volume to the first slab of the tiered volume. If the logical disk is made up of multiple tiers and each tier maps to a set of regions then the first tier for the volume contained on the logical disk has a certain offset within the tier that represents the offset of the volume on the logical disk.  The <b>Alignment</b> member contains this value.
     */
    Alignment : Int64

    /**
     * Total number of available regions.
     */
    TotalNumberOfRegions : UInt32

    /**
     * Number of regions that fit in the output.
     */
    NumberOfRegionsReturned : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-file_storage_tier_region">FILE_STORAGE_TIER_REGION</a> struct that contains detailed information for each region.
     */
    Regions : FILE_STORAGE_TIER_REGION[1]

}
