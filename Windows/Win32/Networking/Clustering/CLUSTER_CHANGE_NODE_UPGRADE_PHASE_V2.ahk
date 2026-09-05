#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_CHANGE_NODE_UPGRADE_PHASE_V2 enumeration (msclus.h) defines the notifications that are generated for the upgrade of a cluster node.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_change_node_upgrade_phase_v2
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_CHANGE_NODE_UPGRADE_PHASE_V2 extends Win32Enum {

    /**
     * Indicates that the upgrade is being prepared.
     * Native name: CLUSTER_CHANGE_UPGRADE_NODE_PREPARE
     * @type {Integer (Int32)}
     */
    static NODE_PREPARE => 1

    /**
     * Indicates that the upgrade is in progress.
     * Native name: CLUSTER_CHANGE_UPGRADE_NODE_COMMIT
     * @type {Integer (Int32)}
     */
    static NODE_COMMIT => 2

    /**
     * Indicates that the upgrade is finished.
     * Native name: CLUSTER_CHANGE_UPGRADE_NODE_POSTCOMMIT
     * @type {Integer (Int32)}
     */
    static NODE_POSTCOMMIT => 4

    /**
     * Indicates all <b>CLUSTER_CHANGE_NODE_UPGRADE_PHASE_V2</b> notifications.
     * Native name: CLUSTER_CHANGE_UPGRADE_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 7
}
