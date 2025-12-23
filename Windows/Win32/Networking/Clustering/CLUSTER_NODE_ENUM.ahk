#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * CLUSTER_NODE_ENUM (msclus.h) describes the types of cluster objects that are enumerated by the ClusterNodeEnum and ClusterNodeOpenEnum functions.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_node_enum
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_NODE_ENUM extends Win32Enum{

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
