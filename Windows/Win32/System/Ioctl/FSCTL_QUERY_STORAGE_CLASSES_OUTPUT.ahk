#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_STORAGE_TIER.ahk" { FILE_STORAGE_TIER }
#Import ".\FILE_STORAGE_TIER_MEDIA_TYPE.ahk" { FILE_STORAGE_TIER_MEDIA_TYPE }
#Import ".\FILE_STORAGE_TIER_FLAGS.ahk" { FILE_STORAGE_TIER_FLAGS }
#Import ".\FILE_STORAGE_TIER_CLASS.ahk" { FILE_STORAGE_TIER_CLASS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information for all tiers of a specific volume.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-fsctl_query_storage_classes_output
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FSCTL_QUERY_STORAGE_CLASSES_OUTPUT {
    #StructPack 8

    /**
     * The size of this structure serves as the version.  Set it to <b>sizeof</b>(<b>FSCTL_QUERY_STORAGE_CLASSES_OUTPUT</b>).
     */
    Version : UInt32

    /**
     * Size of this structure plus all the variable sized fields.
     */
    Size : UInt32

    Flags : FILE_STORAGE_TIER_FLAGS

    /**
     * Total number of available tiers for this disk.
     */
    TotalNumberOfTiers : UInt32

    /**
     * Number of tiers that fit in the output.
     */
    NumberOfTiersReturned : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-file_storage_tier">FILE_STORAGE_TIER</a> structure that contains detailed info on the storage tiers.
     */
    Tiers : FILE_STORAGE_TIER[1]

}
