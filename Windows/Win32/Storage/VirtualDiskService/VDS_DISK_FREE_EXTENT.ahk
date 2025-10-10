#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a free extent on a disk.
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_disk_free_extent
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_DISK_FREE_EXTENT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/VDS/vds-data-types">VDS_OBJECT_ID</a> of the disk.
     * @type {Pointer<Guid>}
     */
    diskId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The disk offset, in bytes, of the free extent.
     * @type {Integer}
     */
    ullOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size, in bytes, of the free extent.
     * @type {Integer}
     */
    ullSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
