#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEPENDENT_DISK_FLAG.ahk" { DEPENDENT_DISK_FLAG }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VIRTUAL_STORAGE_TYPE.ahk" { VIRTUAL_STORAGE_TYPE }

/**
 * Contains virtual hard disk (VHD) storage dependency information for type 1.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-storage_dependency_info_type_1
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct STORAGE_DEPENDENCY_INFO_TYPE_1 {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-dependent_disk_flag">DEPENDENT_DISK_FLAG</a> enumeration.
     */
    DependencyTypeFlags : DEPENDENT_DISK_FLAG

    /**
     * Flags specific to the VHD provider.
     */
    ProviderSpecificFlags : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-virtual_storage_type">VIRTUAL_STORAGE_TYPE</a> structure.
     */
    VirtualStorageType : VIRTUAL_STORAGE_TYPE

}
