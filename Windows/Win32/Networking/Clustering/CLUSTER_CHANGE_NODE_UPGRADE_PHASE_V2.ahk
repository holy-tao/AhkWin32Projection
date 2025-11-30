#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the notifications that are generated for the upgrade of a cluster node.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_change_node_upgrade_phase_v2
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_CHANGE_NODE_UPGRADE_PHASE_V2 extends Win32Enum{

    /**
     * Indicates that the upgrade is being prepared.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_UPGRADE_NODE_PREPARE => 1

    /**
     * Indicates that the upgrade is in progress.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_UPGRADE_NODE_COMMIT => 2

    /**
     * Indicates that the upgrade is finished.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_UPGRADE_NODE_POSTCOMMIT => 4

    /**
     * Indicates all <b>CLUSTER_CHANGE_NODE_UPGRADE_PHASE_V2</b> notifications.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_UPGRADE_ALL => 7
}
