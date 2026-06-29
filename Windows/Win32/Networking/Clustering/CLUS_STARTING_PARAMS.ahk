#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Indicates whether a node's attempt to start the Cluster service represents an attempt to form or join a cluster, and whether the node has attempted to start this version of the Cluster service before.
 * @remarks
 * The  <b>CLUS_STARTING_PARAMS</b> structure allows resource DLLs to respond to the CLUSCTL_RESOURCE_TYPE_STARTING_PHASE1 and CLUSCTL_RESOURCE_TYPE_STARTING_PHASE2 control codes based on the circumstances of the start. For example, a DLL might perform special initialization steps when the cluster forms, and perform another set of operations in response to joins.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_starting_params
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_STARTING_PARAMS {
    #StructPack 4

    /**
     * Byte size of the structure.
     */
    dwSize : UInt32

    /**
     * Indicates whether this particular start of the Cluster service represents a form or a join operation.
     */
    bForm : BOOL

    /**
     * Indicates whether this version of the Cluster service has ever started on the node.
     */
    bFirst : BOOL

}
