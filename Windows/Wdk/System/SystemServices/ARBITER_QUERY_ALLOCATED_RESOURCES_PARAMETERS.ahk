#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CM_PARTIAL_RESOURCE_LIST.ahk" { CM_PARTIAL_RESOURCE_LIST }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ARBITER_QUERY_ALLOCATED_RESOURCES_PARAMETERS {
    #StructPack 8

    AllocatedResources : IntPtr

}
