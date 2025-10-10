#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the potential return values for the ResUtilGetClusterRoleState function.
 * @see https://docs.microsoft.com/windows/win32/api//resapi/ne-resapi-cluster_role_state
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_ROLE_STATE{

    /**
     * It is unknown whether or not the role is clustered.
     * @type {Integer (Int32)}
     */
    static ClusterRoleUnknown => -1

    /**
     * The role is clustered.
     * @type {Integer (Int32)}
     */
    static ClusterRoleClustered => 0

    /**
     * The role is not clustered.
     * @type {Integer (Int32)}
     */
    static ClusterRoleUnclustered => 1
}
