#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSPROP_SYNTAX.ahk
#Include .\CLUSPROP_VALUE.ahk
#Include .\CLUSPROP_RESOURCE_CLASS.ahk
#Include .\CLUSPROP_SZ.ahk

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
 * @version v4.0.30319
 */
class CLUSPROP_REQUIRED_DEPENDENCY extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_value">CLUSPROP_VALUE</a> structure describing whether the data 
     *        in the structure is a resource class or resource type name.
     * @type {CLUSPROP_VALUE}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := CLUSPROP_VALUE(this.ptr + 0)
            return this.__Value
        }
    }

    /**
     * 
     * @type {CLUSPROP_RESOURCE_CLASS}
     */
    ResClass{
        get {
            if(!this.HasProp("__ResClass"))
                this.__ResClass := CLUSPROP_RESOURCE_CLASS(this.ptr + 0)
            return this.__ResClass
        }
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-types">Resource type</a> upon which a resource must depend, such 
     *        as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-address">IP Address</a>.
     * @type {CLUSPROP_SZ}
     */
    ResTypeName{
        get {
            if(!this.HasProp("__ResTypeName"))
                this.__ResTypeName := CLUSPROP_SZ(this.ptr + 0)
            return this.__ResTypeName
        }
    }
}
