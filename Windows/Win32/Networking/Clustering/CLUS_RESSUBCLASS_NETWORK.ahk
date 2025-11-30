#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies a resource subclass that manages an IP address provider.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-clus_ressubclass_network
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_RESSUBCLASS_NETWORK extends Win32Enum{

    /**
     * Identifies a resource subclass that manages an IP address provider. The 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterresourcecontrol">ClusterResourceControl</a> function with the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-class-info">CLUSCTL_RESOURCE_GET_CLASS_INFO</a> 
     *       control code can retrieve a 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clus_resource_class_info">CLUS_RESOURCE_CLASS_INFO</a> structure that contains 
     *       this information.
     * @type {Integer (Int32)}
     */
    static CLUS_RESSUBCLASS_NETWORK_INTERNET_PROTOCOL => -2147483648
}
