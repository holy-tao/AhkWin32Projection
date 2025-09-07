#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A logical container file may be stored in a single segment or multiple segments in the backup store.
 * @remarks
 * For example, in an incremental backup scheme, the container may reside in the store either as one complete file 
  *      generated in a full backup, or as multiple incremental files that contain changes in the file since the previous 
  *      backup.
 * @see https://learn.microsoft.com/windows/win32/api/ddpbackup/ns-ddpbackup-dedup_container_extent
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class DEDUP_CONTAINER_EXTENT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The index in the container list passed to 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ddpbackup/nf-ddpbackup-idedupreadfilecallback-ordercontainersrestore">IDedupReadFileCallback::OrderContainersRestore</a> 
     *       to which this container extent structure corresponds.
     * @type {Integer}
     */
    ContainerIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Offset, in bytes, from the beginning of the container to the beginning of the extent.
     * @type {Integer}
     */
    StartOffset {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Length, in bytes, of the extent.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }
}
