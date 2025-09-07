#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Sent with the CLUSCTL_RESOURCE_STATE_CHANGE_REASON control code to provide the reason for a resource state change.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusctl_resource_state_change_reason_struct
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSCTL_RESOURCE_STATE_CHANGE_REASON_STRUCT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The size of the structure in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The version of the structure. Set to 
     *        <b>CLUSCTL_RESOURCE_STATE_CHANGE_REASON_VERSION_1</b> (1).
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A value of the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_state_change_reason">CLUSTER_RESOURCE_STATE_CHANGE_REASON</a> 
     *       enumeration that describes the reason for the state change. The following list lists the possible values.
     * @type {Integer}
     */
    eReason {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
