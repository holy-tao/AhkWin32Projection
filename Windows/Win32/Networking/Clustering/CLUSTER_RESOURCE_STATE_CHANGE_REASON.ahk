#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by the CLUSCTL_RESOURCE_STATE_CHANGE_REASON_STRUCT and CLUSCTL_RESOURCE_STATE_CHANGE_REASON control codes to describe the reason for a resource state change.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_resource_state_change_reason
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_RESOURCE_STATE_CHANGE_REASON extends Win32Enum{

    /**
     * This reason code is never sent by the cluster. 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">Resource DLLs</a> should use this value to initialize a local 
     *        <a href="https://docs.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusctl_resource_state_change_reason_struct">CLUSCTL_RESOURCE_STATE_CHANGE_REASON_STRUCT</a> structure and to reset the 
     *        <b>eReason</b> member of the 
     *        <b>CLUSCTL_RESOURCE_STATE_CHANGE_REASON_STRUCT</b> 
     *        structure before returning from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> and 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pterminate_routine">Terminate</a> entry point functions. For more information, 
     *        see 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-state-change-reason">CLUSCTL_RESOURCE_STATE_CHANGE_REASON</a>.
     * @type {Integer (Int32)}
     */
    static eResourceStateChangeReasonUnknown => 0

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> is about to be called because the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources">resource's</a> <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups">group</a> is being moved.
     * @type {Integer (Int32)}
     */
    static eResourceStateChangeReasonMove => 1

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pterminate_routine">Terminate</a> is about to be called because the resource's 
     *        group is being <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/failover">failed over</a>.
     * @type {Integer (Int32)}
     */
    static eResourceStateChangeReasonFailover => 2

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Online</a> is about to be called because the resource's 
     *        group did not successfully complete a move operation.
     * @type {Integer (Int32)}
     */
    static eResourceStateChangeReasonFailedMove => 3

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> is about to be called because the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-service">Cluster service</a> is being shut down.
     * @type {Integer (Int32)}
     */
    static eResourceStateChangeReasonShutdown => 4

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pterminate_routine">Terminate</a> is about to be called because the Cluster 
     *        service has stopped unexpectedly.
     * @type {Integer (Int32)}
     */
    static eResourceStateChangeReasonRundown => 5
}
