#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_RESOURCE_STATE_CHANGE_REASON.ahk" { CLUSTER_RESOURCE_STATE_CHANGE_REASON }

/**
 * Sent with the CLUSCTL_RESOURCE_STATE_CHANGE_REASON control code to provide the reason for a resource state change.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusctl_resource_state_change_reason_struct
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSCTL_RESOURCE_STATE_CHANGE_REASON_STRUCT {
    #StructPack 4

    /**
     * The size of the structure in bytes.
     */
    dwSize : UInt32

    /**
     * The version of the structure. Set to 
     *        <b>CLUSCTL_RESOURCE_STATE_CHANGE_REASON_VERSION_1</b> (1).
     */
    dwVersion : UInt32

    /**
     * A value of the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_state_change_reason">CLUSTER_RESOURCE_STATE_CHANGE_REASON</a> 
     *       enumeration that describes the reason for the state change. The following list lists the possible values.
     */
    eReason : CLUSTER_RESOURCE_STATE_CHANGE_REASON

}
