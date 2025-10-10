#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Vhd\VIRTUAL_STORAGE_TYPE.ahk

/**
 * Defines the properties of a virtual disk.
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_vdisk_properties
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_VDISK_PROPERTIES extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Unique VDS-specific session identifier of the disk.
     * @type {Pointer<Guid>}
     */
    Id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_vdisk_state">VDS_VDISK_STATE</a> enumeration value that specifies the virtual disk state.
     * @type {Integer}
     */
    State {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-virtual_storage_type">VIRTUAL_STORAGE_TYPE</a> structure that specifies the storage device type of the virtual disk.
     * @type {VIRTUAL_STORAGE_TYPE}
     */
    VirtualDeviceType{
        get {
            if(!this.HasProp("__VirtualDeviceType"))
                this.__VirtualDeviceType := VIRTUAL_STORAGE_TYPE(this.ptr + 16)
            return this.__VirtualDeviceType
        }
    }

    /**
     * The size, in bytes, of the virtual disk.
     * @type {Integer}
     */
    VirtualSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The on-disk size, in bytes, of the virtual disk backing file.
     * @type {Integer}
     */
    PhysicalSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * A <b>NULL</b>-terminated wide-character string containing the name and directory path of the backing file for the virtual disk.
     * @type {Pointer<Char>}
     */
    pPath {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A <b>NULL</b>-terminated wide-character string containing the name and device path of the disk device object for the volume where the virtual disk resides.
     * @type {Pointer<Char>}
     */
    pDeviceName {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A bitmask of <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-dependent_disk_flag">DEPENDENT_DISK_FLAG</a> enumeration values that specify disk dependency information.
     * @type {Integer}
     */
    DiskFlag {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * <b>TRUE</b> if the virtual disk is a child virtual disk, or <b>FALSE</b> otherwise.
     * @type {Integer}
     */
    bIsChild {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * A <b>NULL</b>-terminated wide-character string that contains an optional path to a parent virtual disk object.
     * @type {Pointer<Char>}
     */
    pParentPath {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
