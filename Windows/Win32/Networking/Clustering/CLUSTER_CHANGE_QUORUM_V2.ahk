#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CLUSTER_CHANGE_QUORUM_V2 enumeration (msclus.h) defines the notifications that are generated for quorum-specific information.
 * @remarks
 * Protocol version 2.0 servers do not support this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_change_quorum_v2
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_CHANGE_QUORUM_V2 {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the quorum configuration of the cluster has changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_QUORUM_STATE_V2 => 1

    /**
     * Indicates all V2 quorum notifications.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_QUORUM_ALL_V2 => 1
}
