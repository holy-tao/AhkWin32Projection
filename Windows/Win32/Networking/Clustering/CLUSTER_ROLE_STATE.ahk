#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the potential return values for the ResUtilGetClusterRoleState function.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ne-resapi-cluster_role_state
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_ROLE_STATE extends Win32Enum {

    /**
     * It is unknown whether or not the role is clustered.
     * Native name: ClusterRoleUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => -1

    /**
     * The role is clustered.
     * Native name: ClusterRoleClustered
     * @type {Integer (Int32)}
     */
    static Clustered => 0

    /**
     * The role is not clustered.
     * Native name: ClusterRoleUnclustered
     * @type {Integer (Int32)}
     */
    static Unclustered => 1
}
