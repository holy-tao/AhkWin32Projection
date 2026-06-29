#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the potential return values for the ResUtilGetClusterRoleState function.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ne-resapi-cluster_role_state
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_ROLE_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
