#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_ENUM enumeration (msclus.h) describes the type of cluster objects being enumerated.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_enum
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_ENUM extends Win32Enum {

    /**
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">nodes</a> in the cluster.
     * Native name: CLUSTER_ENUM_NODE
     * @type {Integer (Int32)}
     */
    static NODE => 1

    /**
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-types">resource types</a> in the cluster.
     * Native name: CLUSTER_ENUM_RESTYPE
     * @type {Integer (Int32)}
     */
    static RESTYPE => 2

    /**
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources">resources</a> in the cluster.
     * Native name: CLUSTER_ENUM_RESOURCE
     * @type {Integer (Int32)}
     */
    static RESOURCE => 4

    /**
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups">groups</a> in the cluster.
     * Native name: CLUSTER_ENUM_GROUP
     * @type {Integer (Int32)}
     */
    static GROUP => 8

    /**
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/networks">networks</a> in the cluster.
     * Native name: CLUSTER_ENUM_NETWORK
     * @type {Integer (Int32)}
     */
    static NETWORK => 16

    /**
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-interfaces">network interfaces</a> in the cluster.
     * Native name: CLUSTER_ENUM_NETINTERFACE
     * @type {Integer (Int32)}
     */
    static NETINTERFACE => 32

    /**
     * Native name: CLUSTER_ENUM_CAPACITY_NODE
     * @type {Integer (Int32)}
     */
    static CAPACITY_NODE => 268435456

    /**
     * The cluster shared volumes (CSV) in the cluster.
     * 
     * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is not supported before 
     *         Windows Server 2012 R2.
     * Native name: CLUSTER_ENUM_SHARED_VOLUME_GROUP
     * @type {Integer (Int32)}
     */
    static SHARED_VOLUME_GROUP => 536870912

    /**
     * The cluster shared volumes in the cluster.
     * 
     * <b>Windows Server 2008:  </b>This value is not supported before 
     *         Windows Server 2008 R2.
     * Native name: CLUSTER_ENUM_SHARED_VOLUME_RESOURCE
     * @type {Integer (Int32)}
     */
    static SHARED_VOLUME_RESOURCE => 1073741824

    /**
     * The networks used by the cluster for internal communication.
     * Native name: CLUSTER_ENUM_INTERNAL_NETWORK
     * @type {Integer (Int32)}
     */
    static INTERNAL_NETWORK => -2147483648

    /**
     * All the cluster objects.
     * Native name: CLUSTER_ENUM_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 63
}
