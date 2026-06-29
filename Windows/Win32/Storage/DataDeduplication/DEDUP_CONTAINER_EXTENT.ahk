#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A logical container file may be stored in a single segment or multiple segments in the backup store.
 * @remarks
 * For example, in an incremental backup scheme, the container may reside in the store either as one complete file 
 *      generated in a full backup, or as multiple incremental files that contain changes in the file since the previous 
 *      backup.
 * @see https://learn.microsoft.com/windows/win32/api/ddpbackup/ns-ddpbackup-dedup_container_extent
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct DEDUP_CONTAINER_EXTENT {
    #StructPack 8

    /**
     * The index in the container list passed to 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ddpbackup/nf-ddpbackup-idedupreadfilecallback-ordercontainersrestore">IDedupReadFileCallback::OrderContainersRestore</a> 
     *       to which this container extent structure corresponds.
     */
    ContainerIndex : UInt32

    /**
     * Offset, in bytes, from the beginning of the container to the beginning of the extent.
     */
    StartOffset : Int64

    /**
     * Length, in bytes, of the extent.
     */
    Length : Int64

}
