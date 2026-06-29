#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CLUSTER_CHANGE_SHARED_VOLUME_V2 enumeration (msclus.h) defines the notifications that are generated for a cluster shared volume.
 * @remarks
 * Protocol version 2.0 servers do not support this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_change_shared_volume_v2
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_CHANGE_SHARED_VOLUME_V2 {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the state of the cluster shared volume has changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_SHARED_VOLUME_STATE_V2 => 1

    /**
     * Indicates that the cluster shared volume was added.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_SHARED_VOLUME_ADDED_V2 => 2

    /**
     * Indicates that the cluster shared volume was removed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_SHARED_VOLUME_REMOVED_V2 => 4

    /**
     * Indicates all V2 cluster shared volume notifications.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_SHARED_VOLUME_ALL_V2 => 7
}
