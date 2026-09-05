#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_OBJECT_TYPE enumeration (msclus.h) defines the type of object for which a notification is requested or generated.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_object_type
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_OBJECT_TYPE extends Win32Enum {

    /**
     * The notification is for an unspecified type.
     * Native name: CLUSTER_OBJECT_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The notification is for the cluster.
     * Native name: CLUSTER_OBJECT_TYPE_CLUSTER
     * @type {Integer (Int32)}
     */
    static CLUSTER => 1

    /**
     * The notification is for a group.
     * Native name: CLUSTER_OBJECT_TYPE_GROUP
     * @type {Integer (Int32)}
     */
    static GROUP => 2

    /**
     * The notification is for a resource.
     * Native name: CLUSTER_OBJECT_TYPE_RESOURCE
     * @type {Integer (Int32)}
     */
    static RESOURCE => 3

    /**
     * The notification is for a resource type.
     * Native name: CLUSTER_OBJECT_TYPE_RESOURCE_TYPE
     * @type {Integer (Int32)}
     */
    static RESOURCE_TYPE => 4

    /**
     * The notification is for a cluster network interface.
     * Native name: CLUSTER_OBJECT_TYPE_NETWORK_INTERFACE
     * @type {Integer (Int32)}
     */
    static NETWORK_INTERFACE => 5

    /**
     * The notification is for a cluster network.
     * Native name: CLUSTER_OBJECT_TYPE_NETWORK
     * @type {Integer (Int32)}
     */
    static NETWORK => 6

    /**
     * The notification is for a cluster node.
     * Native name: CLUSTER_OBJECT_TYPE_NODE
     * @type {Integer (Int32)}
     */
    static NODE => 7

    /**
     * The notification is for a cluster registry key.
     * Native name: CLUSTER_OBJECT_TYPE_REGISTRY
     * @type {Integer (Int32)}
     */
    static REGISTRY => 8

    /**
     * The notification is for a quorum resource.
     * Native name: CLUSTER_OBJECT_TYPE_QUORUM
     * @type {Integer (Int32)}
     */
    static QUORUM => 9

    /**
     * The notification is for a cluster shared volume.
     * Native name: CLUSTER_OBJECT_TYPE_SHARED_VOLUME
     * @type {Integer (Int32)}
     */
    static SHARED_VOLUME => 10

    /**
     * The notification is for a groupset.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This value is unavailable prior to Windows Server 2016.
     * Native name: CLUSTER_OBJECT_TYPE_GROUPSET
     * @type {Integer (Int32)}
     */
    static GROUPSET => 13

    /**
     * Native name: CLUSTER_OBJECT_TYPE_AFFINITYRULE
     * @type {Integer (Int32)}
     */
    static AFFINITYRULE => 16

    /**
     * Native name: CLUSTER_OBJECT_TYPE_FAULTDOMAIN
     * @type {Integer (Int32)}
     */
    static FAULTDOMAIN => 17
}
