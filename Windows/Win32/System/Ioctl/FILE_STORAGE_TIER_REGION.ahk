#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes a single storage tier region.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_storage_tier_region
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_STORAGE_TIER_REGION {
    #StructPack 8

    /**
     * Tier ID.
     */
    TierId : Guid

    /**
     * Offset from the beginning of the volume of this region, in bytes.
     */
    Offset : Int64

    /**
     * Length of region in bytes.
     */
    Length : Int64

}
