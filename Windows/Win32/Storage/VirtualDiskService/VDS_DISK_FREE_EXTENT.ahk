#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes a free extent on a disk.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_disk_free_extent
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_DISK_FREE_EXTENT {
    #StructPack 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/VDS/vds-data-types">VDS_OBJECT_ID</a> of the disk.
     */
    diskId : Guid

    /**
     * The disk offset, in bytes, of the free extent.
     */
    ullOffset : Int64

    /**
     * The size, in bytes, of the free extent.
     */
    ullSize : Int64

}
