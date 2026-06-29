#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Used by the SetClusterServiceAccountPassword function to return the results of a Cluster service user account password change for each cluster node.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-cluster_set_password_status
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_SET_PASSWORD_STATUS {
    #StructPack 4

    /**
     * Identifies the node on which the password change attempt was made.
     */
    NodeId : UInt32

    /**
     * If <b>TRUE</b>, indicates that the password change was attempted on this node.
     */
    SetAttempted : BOOLEAN

    /**
     * An error code describing the results of the password change.
     */
    ReturnStatus : UInt32

}
