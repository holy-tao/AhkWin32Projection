#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_VDISK_STATE.ahk
#Include ..\Vhd\VIRTUAL_STORAGE_TYPE.ahk
#Include ..\Vhd\DEPENDENT_DISK_FLAG.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Defines the properties of a virtual disk.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_vdisk_properties
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_VDISK_PROPERTIES extends Win32Struct {
    static sizeof => 88

    static packingSize => 8

    /**
     * Unique VDS-specific session identifier of the disk.
     * @type {Guid}
     */
    Id {
        get {
            if(!this.HasProp("__Id"))
                this.__Id := Guid(0, this)
            return this.__Id
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_vdisk_state">VDS_VDISK_STATE</a> enumeration value that specifies the virtual disk state.
     * @type {VDS_VDISK_STATE}
     */
    State {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-virtual_storage_type">VIRTUAL_STORAGE_TYPE</a> structure that specifies the storage device type of the virtual disk.
     * @type {VIRTUAL_STORAGE_TYPE}
     */
    VirtualDeviceType {
        get {
            if(!this.HasProp("__VirtualDeviceType"))
                this.__VirtualDeviceType := VIRTUAL_STORAGE_TYPE(20, this)
            return this.__VirtualDeviceType
        }
    }

    /**
     * The size, in bytes, of the virtual disk.
     * @type {Integer}
     */
    VirtualSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The on-disk size, in bytes, of the virtual disk backing file.
     * @type {Integer}
     */
    PhysicalSize {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A <b>NULL</b>-terminated wide-character string containing the name and directory path of the backing file for the virtual disk.
     * @type {PWSTR}
     */
    pPath {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A <b>NULL</b>-terminated wide-character string containing the name and device path of the disk device object for the volume where the virtual disk resides.
     * @type {PWSTR}
     */
    pDeviceName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A bitmask of <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-dependent_disk_flag">DEPENDENT_DISK_FLAG</a> enumeration values that specify disk dependency information.
     * @type {DEPENDENT_DISK_FLAG}
     */
    DiskFlag {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * <b>TRUE</b> if the virtual disk is a child virtual disk, or <b>FALSE</b> otherwise.
     * @type {BOOL}
     */
    bIsChild {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * A <b>NULL</b>-terminated wide-character string that contains an optional path to a parent virtual disk object.
     * @type {PWSTR}
     */
    pParentPath {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
