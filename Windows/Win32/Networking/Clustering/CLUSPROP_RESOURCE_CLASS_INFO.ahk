#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_VALUE.ahk" { CLUSPROP_VALUE }
#Import ".\CLUS_RESOURCE_CLASS_INFO.ahk" { CLUS_RESOURCE_CLASS_INFO }
#Import ".\CLUSTER_RESOURCE_CLASS.ahk" { CLUSTER_RESOURCE_CLASS }
#Import ".\CLUSPROP_SYNTAX.ahk" { CLUSPROP_SYNTAX }

/**
 * Describes information relating to a resource class.
 * @remarks
 * A resource class identifies resources of similar capability. A 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">resource DLL</a> that defines its own resource class should 
 *     provide a unique identifier for the class that is set to a value greater than 
 *     <b>CLUS_RESCLASS_USER</b>. <b>CLUS_RESCLASS_USER</b> specifies the beginning 
 *     for user-defined resource class identifiers.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_resource_class_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSPROP_RESOURCE_CLASS_INFO {
    #StructPack 8

    Base : CLUSPROP_VALUE

    Base2 : CLUS_RESOURCE_CLASS_INFO

}
