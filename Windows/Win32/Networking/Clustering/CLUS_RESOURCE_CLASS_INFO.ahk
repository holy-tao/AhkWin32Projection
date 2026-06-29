#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_RESOURCE_CLASS.ahk" { CLUSTER_RESOURCE_CLASS }

/**
 * Contains resource class data. It is used as the data member of a CLUSPROP_RESOURCE_CLASS_INFO structure and as the return value of some control code operations.
 * @remarks
 * A resource class identifies resources of similar capability. A 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">resource DLL</a> that defines its own resource class should 
 *      provide a unique identifier for the class that is set to a value greater than 
 *      <b>CLUS_RESCLASS_USER</b>. <b>CLUS_RESCLASS_USER</b> specifies the 
 *      beginning for user-defined resource class identifiers.
 * 
 * A <b>CLUS_RESOURCE_CLASS_INFO</b> structure is 
 *      returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterresourcecontrol">ClusterResourceControl</a> when the 
 *      <i>dwControlCode</i> parameter is set to 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-class-info">CLUSCTL_RESOURCE_GET_CLASS_INFO</a> 
 *      and is returned by 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterresourcetypecontrol">ClusterResourceTypeControl</a> when 
 *      <i>dwControlCode</i> is set to 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-class-info">CLUSCTL_RESOURCE_TYPE_GET_CLASS_INFO</a>.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_resource_class_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_RESOURCE_CLASS_INFO {
    #StructPack 8

    dw : UInt32

    SubClass : UInt32

    static __New() {
        DefineProp(this.Prototype, 'rc', { type: CLUSTER_RESOURCE_CLASS, offset: 0 })
        DefineProp(this.Prototype, 'li', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
