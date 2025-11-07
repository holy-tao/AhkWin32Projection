#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies a resource subclass that manages a shared resource.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-clus_ressubclass
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_RESSUBCLASS{

    /**
     * Identifies a resource subclass that manages a shared resource, such as a disk on a shared SCSI bus. The 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterresourcecontrol">ClusterResourceControl</a> function with the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-class-info">CLUSCTL_RESOURCE_GET_CLASS_INFO</a> 
     *       control code can retrieve a 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clus_resource_class_info">CLUS_RESOURCE_CLASS_INFO</a> structure that contains 
     *       this information.
     * @type {Integer (Int32)}
     */
    static CLUS_RESSUBCLASS_SHARED => -2147483648
}
