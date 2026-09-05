#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_CHANGE_SHARED_VOLUME_V2 enumeration (msclus.h) defines the notifications that are generated for a cluster shared volume.
 * @remarks
 * Protocol version 2.0 servers do not support this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_change_shared_volume_v2
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_CHANGE_SHARED_VOLUME_V2 extends Win32Enum {

    /**
     * Indicates that the state of the cluster shared volume has changed.
     * Native name: CLUSTER_CHANGE_SHARED_VOLUME_STATE_V2
     * @type {Integer (Int32)}
     */
    static STATE_V2 => 1

    /**
     * Indicates that the cluster shared volume was added.
     * Native name: CLUSTER_CHANGE_SHARED_VOLUME_ADDED_V2
     * @type {Integer (Int32)}
     */
    static ADDED_V2 => 2

    /**
     * Indicates that the cluster shared volume was removed.
     * Native name: CLUSTER_CHANGE_SHARED_VOLUME_REMOVED_V2
     * @type {Integer (Int32)}
     */
    static REMOVED_V2 => 4

    /**
     * Indicates all V2 cluster shared volume notifications.
     * Native name: CLUSTER_CHANGE_SHARED_VOLUME_ALL_V2
     * @type {Integer (Int32)}
     */
    static ALL_V2 => 7
}
