#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Used by the SetClusterServiceAccountPassword function to return the results of a Cluster service user account password change for each cluster node.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-cluster_set_password_status
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_SET_PASSWORD_STATUS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Identifies the node on which the password change attempt was made.
     * @type {Integer}
     */
    NodeId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If <b>TRUE</b>, indicates that the password change was attempted on this node.
     * @type {BOOLEAN}
     */
    SetAttempted{
        get {
            if(!this.HasProp("__SetAttempted"))
                this.__SetAttempted := BOOLEAN(this.ptr + 4)
            return this.__SetAttempted
        }
    }

    /**
     * An error code describing the results of the password change.
     * @type {Integer}
     */
    ReturnStatus {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
