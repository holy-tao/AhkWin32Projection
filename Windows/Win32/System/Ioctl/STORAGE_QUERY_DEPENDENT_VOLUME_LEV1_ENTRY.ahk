#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Storage\Vhd\VIRTUAL_STORAGE_TYPE.ahk" { VIRTUAL_STORAGE_TYPE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_QUERY_DEPENDENT_VOLUME_LEV1_ENTRY {
    #StructPack 4

    EntryLength : UInt32

    DependencyTypeFlags : UInt32

    ProviderSpecificFlags : UInt32

    VirtualStorageType : VIRTUAL_STORAGE_TYPE

}
