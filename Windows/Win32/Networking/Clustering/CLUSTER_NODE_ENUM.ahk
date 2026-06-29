#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * CLUSTER_NODE_ENUM (msclus.h) describes the types of cluster objects that are enumerated by the ClusterNodeEnum and ClusterNodeOpenEnum functions.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_node_enum
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_NODE_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Network interfaces on the node.
     * @type {Integer (Int32)}
     */
    static CLUSTER_NODE_ENUM_NETINTERFACES => 1

    /**
     * Cluster groups on the node.
     * 
     * <b>Windows Server 2008:  </b>This value is not supported before 
     *         Windows Server 2008 R2.
     * @type {Integer (Int32)}
     */
    static CLUSTER_NODE_ENUM_GROUPS => 2

    /**
     * Cluster groups that list this node as their preferred owner.
     * 
     * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is supported before 
     *         Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLUSTER_NODE_ENUM_PREFERRED_GROUPS => 4

    /**
     * Network interfaces on the node, groups on the node, and groups that list the node as their preferred owner..
     * @type {Integer (Int32)}
     */
    static CLUSTER_NODE_ENUM_ALL => 3
}
