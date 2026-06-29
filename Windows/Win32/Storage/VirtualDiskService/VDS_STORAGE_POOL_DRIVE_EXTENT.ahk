#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VDS_STORAGE_POOL_DRIVE_EXTENT structure (vdshwprv.h) defines a drive extent that could be used by a storage pool.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_storage_pool_drive_extent
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_STORAGE_POOL_DRIVE_EXTENT {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/VDS/vds-data-types">VDS_OBJECT_ID</a> value that identifies the <a href="https://docs.microsoft.com/windows/desktop/VDS/drive-object">drive object</a>.
     */
    id : Guid

    /**
     * Size, in bytes, of the drive extent.
     */
    ullSize : Int64

    /**
     * <b>TRUE</b> if the drive extent is currently being used by the storage pool, <b>FALSE</b> otherwise.
     */
    bUsed : BOOL

}
