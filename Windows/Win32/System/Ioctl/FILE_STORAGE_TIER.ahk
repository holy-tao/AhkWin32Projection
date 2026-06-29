#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_STORAGE_TIER_MEDIA_TYPE.ahk" { FILE_STORAGE_TIER_MEDIA_TYPE }
#Import ".\FILE_STORAGE_TIER_CLASS.ahk" { FILE_STORAGE_TIER_CLASS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Represents an identifier for the storage tier relative to the volume.
 * @remarks
 * The storage tier ID for a particular volume has no relationship to the storage tier ID with the same value on a different volume.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_storage_tier
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_STORAGE_TIER {
    #StructPack 8

    /**
     * Tier ID.
     */
    Id : Guid

    /**
     * Name for the tier.
     */
    Name : WCHAR[256]

    /**
     * Note for the tier.
     */
    Description : WCHAR[256]

    Flags : Int64

    /**
     * Provisioned capacity of the tier.
     */
    ProvisionedCapacity : Int64

    /**
     * Media type of the tier.
     */
    MediaType : FILE_STORAGE_TIER_MEDIA_TYPE

    Class : FILE_STORAGE_TIER_CLASS

}
