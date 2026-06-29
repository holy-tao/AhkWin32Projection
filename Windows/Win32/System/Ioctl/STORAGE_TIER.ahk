#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_TIER_MEDIA_TYPE.ahk" { STORAGE_TIER_MEDIA_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\STORAGE_TIER_CLASS.ahk" { STORAGE_TIER_CLASS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_TIER {
    #StructPack 8

    Id : Guid

    Name : WCHAR[256]

    Description : WCHAR[256]

    Flags : Int64

    ProvisionedCapacity : Int64

    MediaType : STORAGE_TIER_MEDIA_TYPE

    Class : STORAGE_TIER_CLASS

}
