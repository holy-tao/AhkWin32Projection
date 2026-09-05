#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * CLUS_CHARACTERISTICS (msclus.h) enumerates characteristics of resource types and resources.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-clus_characteristics
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUS_CHARACTERISTICS extends Win32Enum {

    /**
     * Resources of this type have no known characteristics.
     * Native name: CLUS_CHAR_UNKNOWN
     * @type {Integer (Int32)}
     */
    static CHAR_UNKNOWN => 0

    /**
     * Resources of this type are capable of being the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/quorum-resource">quorum resource type</a> for a cluster.
     * Native name: CLUS_CHAR_QUORUM
     * @type {Integer (Int32)}
     */
    static CHAR_QUORUM => 1

    /**
     * Resources of this type cannot be deleted unless all nodes are active.
     * Native name: CLUS_CHAR_DELETE_REQUIRES_ALL_NODES
     * @type {Integer (Int32)}
     */
    static CHAR_DELETE_REQUIRES_ALL_NODES => 2

    /**
     * Not supported.
     * Native name: CLUS_CHAR_LOCAL_QUORUM
     * @type {Integer (Int32)}
     */
    static CHAR_LOCAL_QUORUM => 4

    /**
     * Not supported.
     * Native name: CLUS_CHAR_LOCAL_QUORUM_DEBUG
     * @type {Integer (Int32)}
     */
    static CHAR_LOCAL_QUORUM_DEBUG => 8

    /**
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">resource DLL</a> will receive the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-state-change-reason">CLUSCTL_RESOURCE_STATE_CHANGE_REASON</a> 
     *        control code.
     * Native name: CLUS_CHAR_REQUIRES_STATE_CHANGE_REASON
     * @type {Integer (Int32)}
     */
    static CHAR_REQUIRES_STATE_CHANGE_REASON => 16

    /**
     * Not supported.
     * Native name: CLUS_CHAR_BROADCAST_DELETE
     * @type {Integer (Int32)}
     */
    static CHAR_BROADCAST_DELETE => 32

    /**
     * Only one instance of this resource type is allowed in a cluster.
     * Native name: CLUS_CHAR_SINGLE_CLUSTER_INSTANCE
     * @type {Integer (Int32)}
     */
    static CHAR_SINGLE_CLUSTER_INSTANCE => 64

    /**
     * Only one instance of this resource type is allowed in a group.
     * Native name: CLUS_CHAR_SINGLE_GROUP_INSTANCE
     * @type {Integer (Int32)}
     */
    static CHAR_SINGLE_GROUP_INSTANCE => 128

    /**
     * The resource can be made part of a special group. Protocol version 2.0 servers do not support this value.
     * Native name: CLUS_CHAR_COEXIST_IN_SHARED_VOLUME_GROUP
     * @type {Integer (Int32)}
     */
    static CHAR_COEXIST_IN_SHARED_VOLUME_GROUP => 256

    /**
     * The resource type can be queried to get more information about how many resources it uses. For example, in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/virtual-machine">virtual machine</a> resource type, information is returned about how much memory is required for the virtual machine to be started.
     * 
     * <b>Windows Server 2008 R2 and Windows Server 2008:  </b>This enumeration value is not supported before Windows Server 2012.
     * Native name: CLUS_CHAR_PLACEMENT_DATA
     * @type {Integer (Int32)}
     */
    static CHAR_PLACEMENT_DATA => 512

    /**
     * The resource can be deleted without being taken offline. Protocol version 2.0 servers do not support this value.
     * Native name: CLUS_CHAR_MONITOR_DETACH
     * @type {Integer (Int32)}
     */
    static CHAR_MONITOR_DETACH => 1024

    /**
     * This value is reserved for local use and must be ignored by the client. Protocol version 2.0 servers do not support this value.
     * Native name: CLUS_CHAR_MONITOR_REATTACH
     * @type {Integer (Int32)}
     */
    static CHAR_MONITOR_REATTACH => 2048

    /**
     * This value is reserved for local use and must be ignored by the client. Protocol version 2.0 servers do not support this value.
     * Native name: CLUS_CHAR_OPERATION_CONTEXT
     * @type {Integer (Int32)}
     */
    static CHAR_OPERATION_CONTEXT => 4096

    /**
     * This value is reserved for local use and must be ignored by the client. Protocol version 2.0 servers do not support this value.
     * Native name: CLUS_CHAR_CLONES
     * @type {Integer (Int32)}
     */
    static CHAR_CLONES => 8192

    /**
     * The resource should not be preempted, even if the whole group is being preempted.
     * 
     * <b>Windows Server 2008 R2 and Windows Server 2008:  </b>This enumeration value is not supported before Windows Server 2012.
     * Native name: CLUS_CHAR_NOT_PREEMPTABLE
     * @type {Integer (Int32)}
     */
    static CHAR_NOT_PREEMPTABLE => 16384

    /**
     * The resource can receive a new owner.
     * 
     * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This enumeration value is not supported before Windows Server 2012 R2.
     * Native name: CLUS_CHAR_NOTIFY_NEW_OWNER
     * @type {Integer (Int32)}
     */
    static CHAR_NOTIFY_NEW_OWNER => 32768

    /**
     * The resource can continue run in an unmonitored state when it losses cluster membership.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This enumeration value is not supported before Windows Server 2016.
     * Native name: CLUS_CHAR_SUPPORTS_UNMONITORED_STATE
     * @type {Integer (Int32)}
     */
    static CHAR_SUPPORTS_UNMONITORED_STATE => 65536

    /**
     * This value is reserved for infrastructure.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This enumeration value is not supported before Windows Server 2016.
     * Native name: CLUS_CHAR_INFRASTRUCTURE
     * @type {Integer (Int32)}
     */
    static CHAR_INFRASTRUCTURE => 131072

    /**
     * Native name: CLUS_CHAR_VETO_DRAIN
     * @type {Integer (Int32)}
     */
    static CHAR_VETO_DRAIN => 262144

    /**
     * Native name: CLUS_CHAR_DRAIN_LOCAL_OFFLINE
     * @type {Integer (Int32)}
     */
    static CHAR_DRAIN_LOCAL_OFFLINE => 524288
}
