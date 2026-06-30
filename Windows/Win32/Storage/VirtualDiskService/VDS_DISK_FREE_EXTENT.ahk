#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes a free extent on a disk.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_disk_free_extent
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_DISK_FREE_EXTENT extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/VDS/vds-data-types">VDS_OBJECT_ID</a> of the disk.
     * @type {Guid}
     */
    diskId {
        get {
            if(!this.HasProp("__diskId"))
                this.__diskId := Guid(0, this)
            return this.__diskId
        }
    }

    /**
     * The disk offset, in bytes, of the free extent.
     * @type {Integer}
     */
    ullOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The size, in bytes, of the free extent.
     * @type {Integer}
     */
    ullSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
