#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_VALUE.ahk" { CLUSPROP_VALUE }
#Import ".\CLUSPROP_RESOURCE_CLASS.ahk" { CLUSPROP_RESOURCE_CLASS }
#Import ".\CLUSPROP_SZ.ahk" { CLUSPROP_SZ }
#Import ".\CLUSTER_RESOURCE_CLASS.ahk" { CLUSTER_RESOURCE_CLASS }
#Import ".\CLUSPROP_SYNTAX.ahk" { CLUSPROP_SYNTAX }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes a resource that is a required dependency of another resource. This union is used as a value in the value list returned from a CLUSCTL_RESOURCE_GET_REQUIRED_DEPENDENCIES or CLUSCTL_RESOURCE_TYPE_GET_REQUIRED_DEPENDENCIES control code operation.
 * @remarks
 * The <b>CLUSPROP_REQUIRED_DEPENDENCY</b> 
 *      structure describes mandatory dependencies. For example, a 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/print-spooler">Print Spooler</a> resource has required dependencies on a 
 *      storage device and a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-name">Network Name</a> resource. The first type of 
 *      dependency is described using a resource class; storage device resources belong to the 
 *      <b>CLUS_RESCLASS_STORAGE</b> resource class. The second type of dependency is described 
 *      using a resource type name, such as "Network Name". Therefore, when an application calls 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterresourcecontrol">ClusterResourceControl</a> with the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-required-dependencies">CLUSCTL_RESOURCE_GET_REQUIRED_DEPENDENCIES</a> 
 *      control code, a value list is returned with two entries: a 
 *      <b>CLUSPROP_REQUIRED_DEPENDENCY</b> structure 
 *      with the <b>ResClass</b> member set to <b>CLUS_RESCLASS_STORAGE</b>, and 
 *      a second <b>CLUSPROP_REQUIRED_DEPENDENCY</b> 
 *      structure with the <b>ResTypeName</b> member set to "Network Name".
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_required_dependency
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSPROP_REQUIRED_DEPENDENCY {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_value">CLUSPROP_VALUE</a> structure describing whether the data 
     *        in the structure is a resource class or resource type name.
     */
    Value : CLUSPROP_VALUE

    static __New() {
        DefineProp(this.Prototype, 'ResClass', { type: CLUSPROP_RESOURCE_CLASS, offset: 0 })
        DefineProp(this.Prototype, 'ResTypeName', { type: CLUSPROP_SZ, offset: 0 })
        this.DeleteProp("__New")
    }
}
