#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents information about a Chkdsk operation.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_chkdsk_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_CHKDSK_INFO {
    #StructPack 8

    /**
     * The ID of the partition on which the Chkdsk operation is being performed.
     */
    PartitionNumber : UInt32

    /**
     * The state of the Chkdsk operation.
     */
    ChkdskState : UInt32

    /**
     * The number of files that were identified by the Chkdsk operation.
     */
    FileIdCount : UInt32

    /**
     * A list of file IDs that were identified by the Chkdsk operation.
     */
    FileIdList : Int64[1]

}
