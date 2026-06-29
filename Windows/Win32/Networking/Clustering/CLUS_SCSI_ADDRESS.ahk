#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains SCSI address data. It is used as the data member of a CLUSPROP_SCSI_ADDRESS structure and as the return value of some control code operations.
 * @remarks
 * A <b>CLUS_SCSI_ADDRESS</b> structure can also be returned 
 *      by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterresourcecontrol">ClusterResourceControl</a> when the 
 *      <i>dwControlCode</i> parameter is set to 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-disk-info">CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO</a> 
 *      and can be returned by 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterresourcetypecontrol">ClusterResourceTypeControl</a> when 
 *      <i>dwControlCode</i> is set to 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-get-available-disks">CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS</a>.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_scsi_address
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_SCSI_ADDRESS {
    #StructPack 4

    PortNumber : Int8

    PathId : Int8

    TargetId : Int8

    Lun : Int8

    static __New() {
        DefineProp(this.Prototype, 'dw', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
