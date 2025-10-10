#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies a resource subclass that manages a shared bus.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-clus_ressubclass_storage
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_RESSUBCLASS_STORAGE{

    /**
     * Identifies a resource subclass that manages a shared bus. The 
 *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterresourcecontrol">ClusterResourceControl</a> function with the 
 *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-class-info">CLUSCTL_RESOURCE_GET_CLASS_INFO</a> 
 *       control code can retrieve a 
 *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clus_resource_class_info">CLUS_RESOURCE_CLASS_INFO</a> structure that contains 
 *       information for a resource subclass.
     * @type {Integer (Int32)}
     */
    static CLUS_RESSUBCLASS_STORAGE_SHARED_BUS => -2147483648

    /**
     * Identifies a resource subclass that manages a disk.
 * 
 * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is not supported before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLUS_RESSUBCLASS_STORAGE_DISK => 1073741824

    /**
     * Identifies a resource subclass that manages storage replication.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is not supported before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUS_RESSUBCLASS_STORAGE_REPLICATION => 268435456
}
