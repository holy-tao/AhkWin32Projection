#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the parameters to be used when a virtual disk is created.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_create_vdisk_parameters
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_CREATE_VDISK_PARAMETERS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A unique GUID value to be assigned to the virtual disk.
     * @type {Pointer<Guid>}
     */
    UniqueId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The maximum virtual size, in bytes, of the virtual disk object.
     * @type {Integer}
     */
    MaximumSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The internal block size, in bytes, of the virtual disk object.
     * @type {Integer}
     */
    BlockSizeInBytes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Internal sector size, in bytes, of the virtual disk object.
     * @type {Integer}
     */
    SectorSizeInBytes {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A <b>NULL</b>-terminated wide-character string that contains an optional path to a parent virtual disk object. This member associates the new virtual disk with an existing virtual disk.
     * @type {Pointer<Char>}
     */
    pParentPath {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A <b>NULL</b>-terminated wide-character string that contains an optional path to a source of data to be copied to the new virtual disk.
     * @type {Pointer<Char>}
     */
    pSourcePath {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
