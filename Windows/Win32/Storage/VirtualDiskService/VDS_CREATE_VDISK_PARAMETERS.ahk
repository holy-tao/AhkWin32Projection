#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the parameters to be used when a virtual disk is created.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_create_vdisk_parameters
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_CREATE_VDISK_PARAMETERS extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * A unique GUID value to be assigned to the virtual disk.
     * @type {Guid}
     */
    UniqueId {
        get {
            if(!this.HasProp("__UniqueId"))
                this.__UniqueId := Guid(0, this)
            return this.__UniqueId
        }
    }

    /**
     * The maximum virtual size, in bytes, of the virtual disk object.
     * @type {Integer}
     */
    MaximumSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The internal block size, in bytes, of the virtual disk object.
     * @type {Integer}
     */
    BlockSizeInBytes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Internal sector size, in bytes, of the virtual disk object.
     * @type {Integer}
     */
    SectorSizeInBytes {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * A <b>NULL</b>-terminated wide-character string that contains an optional path to a parent virtual disk object. This member associates the new virtual disk with an existing virtual disk.
     * @type {PWSTR}
     */
    pParentPath {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A <b>NULL</b>-terminated wide-character string that contains an optional path to a source of data to be copied to the new virtual disk.
     * @type {PWSTR}
     */
    pSourcePath {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
