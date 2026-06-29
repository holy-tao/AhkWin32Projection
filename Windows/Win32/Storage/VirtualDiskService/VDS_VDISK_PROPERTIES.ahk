#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Vhd\DEPENDENT_DISK_FLAG.ahk" { DEPENDENT_DISK_FLAG }
#Import ".\VDS_VDISK_STATE.ahk" { VDS_VDISK_STATE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Vhd\VIRTUAL_STORAGE_TYPE.ahk" { VIRTUAL_STORAGE_TYPE }

/**
 * Defines the properties of a virtual disk.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_vdisk_properties
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_VDISK_PROPERTIES {
    #StructPack 8

    /**
     * Unique VDS-specific session identifier of the disk.
     */
    Id : Guid

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_vdisk_state">VDS_VDISK_STATE</a> enumeration value that specifies the virtual disk state.
     */
    State : VDS_VDISK_STATE

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-virtual_storage_type">VIRTUAL_STORAGE_TYPE</a> structure that specifies the storage device type of the virtual disk.
     */
    VirtualDeviceType : VIRTUAL_STORAGE_TYPE

    /**
     * The size, in bytes, of the virtual disk.
     */
    VirtualSize : Int64

    /**
     * The on-disk size, in bytes, of the virtual disk backing file.
     */
    PhysicalSize : Int64

    /**
     * A <b>NULL</b>-terminated wide-character string containing the name and directory path of the backing file for the virtual disk.
     */
    pPath : PWSTR

    /**
     * A <b>NULL</b>-terminated wide-character string containing the name and device path of the disk device object for the volume where the virtual disk resides.
     */
    pDeviceName : PWSTR

    /**
     * A bitmask of <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-dependent_disk_flag">DEPENDENT_DISK_FLAG</a> enumeration values that specify disk dependency information.
     */
    DiskFlag : DEPENDENT_DISK_FLAG

    /**
     * <b>TRUE</b> if the virtual disk is a child virtual disk, or <b>FALSE</b> otherwise.
     */
    bIsChild : BOOL

    /**
     * A <b>NULL</b>-terminated wide-character string that contains an optional path to a parent virtual disk object.
     */
    pParentPath : PWSTR

}
