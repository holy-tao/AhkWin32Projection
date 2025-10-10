#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the notifications that are generated for quorum-specific information.
 * @remarks
 * 
  * Protocol version 2.0 servers do not support this enumeration.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_change_quorum_v2
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_CHANGE_QUORUM_V2{

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
