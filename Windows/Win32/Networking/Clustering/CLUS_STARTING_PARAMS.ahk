#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates whether a node's attempt to start the Cluster service represents an attempt to form or join a cluster, and whether the node has attempted to start this version of the Cluster service before.
 * @remarks
 * 
  * The  <b>CLUS_STARTING_PARAMS</b> structure allows resource DLLs to respond to the CLUSCTL_RESOURCE_TYPE_STARTING_PHASE1 and CLUSCTL_RESOURCE_TYPE_STARTING_PHASE2 control codes based on the circumstances of the start. For example, a DLL might perform special initialization steps when the cluster forms, and perform another set of operations in response to joins.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clus_starting_params
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_STARTING_PARAMS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Byte size of the structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates whether this particular start of the Cluster service represents a form or a join operation.
     * @type {Integer}
     */
    bForm {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Indicates whether this version of the Cluster service has ever started on the node.
     * @type {Integer}
     */
    bFirst {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
