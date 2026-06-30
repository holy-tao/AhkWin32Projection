#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The VDS_STORAGE_POOL_DRIVE_EXTENT structure (vdshwprv.h) defines a drive extent that could be used by a storage pool.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_storage_pool_drive_extent
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_STORAGE_POOL_DRIVE_EXTENT extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/VDS/vds-data-types">VDS_OBJECT_ID</a> value that identifies the <a href="https://docs.microsoft.com/windows/desktop/VDS/drive-object">drive object</a>.
     * @type {Guid}
     */
    id {
        get {
            if(!this.HasProp("__id"))
                this.__id := Guid(0, this)
            return this.__id
        }
    }

    /**
     * Size, in bytes, of the drive extent.
     * @type {Integer}
     */
    ullSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * <b>TRUE</b> if the drive extent is currently being used by the storage pool, <b>FALSE</b> otherwise.
     * @type {BOOL}
     */
    bUsed {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
