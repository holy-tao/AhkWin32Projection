#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DEPENDENT_DISK_FLAG.ahk" { DEPENDENT_DISK_FLAG }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VIRTUAL_STORAGE_TYPE.ahk" { VIRTUAL_STORAGE_TYPE }

/**
 * Contains VHD or ISO storage dependency information for type 2.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-storage_dependency_info_type_2
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct STORAGE_DEPENDENCY_INFO_TYPE_2 {
    #StructPack 8

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

    /**
     * The ancestor level.
     */
    AncestorLevel : UInt32

    /**
     * The device name of the dependent device. If the device is a virtual hard drive then this will be in the 
     *       form \\.\PhysicalDrive<i>N</i>. If the device is a virtual CD or DVD drive 
     *       (ISO) then this will be in the form \\.\CDRom<i>N</i>. In either case 
     *       <i>N</i> is an integer that represents a unique identifier for the caller's host 
     *       system.
     */
    DependencyDeviceName : PWSTR

    /**
     * The host disk volume name in the form \\?\Volume{<i>GUID</i>}\ where 
     *       <i>GUID</i> is the <b>GUID</b> that identifies the volume.
     */
    HostVolumeName : PWSTR

    /**
     * The name of the dependent volume, if any, in the form 
     *       \\?\Volume{<i>GUID</i>}\ where <i>GUID</i> is the 
     *       <b>GUID</b> that identifies the volume.
     */
    DependentVolumeName : PWSTR

    /**
     * The relative path to the dependent volume.
     */
    DependentVolumeRelativePath : PWSTR

}
