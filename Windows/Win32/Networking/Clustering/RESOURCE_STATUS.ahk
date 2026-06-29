#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_RESOURCE_STATE.ahk" { CLUSTER_RESOURCE_STATE }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Contains information about a resource that is being brought online or taken offline. This structure is used as a parameter to the callback function SetResourceStatus.
 * @remarks
 * Resource DLLs typically set the <b>ResourceState</b> member to 
 *      <b>ClusterResourceOnline</b> or <b>ClusterResourceOffline</b>. However, 
 *      if <b>ResourceState</b> is set to <b>ClusterResourceOnlinePending</b> or 
 *      <b>ClusterResourceOfflinePending</b>, the <b>CheckPoint</b> member 
 *      should be greater than the previous value reported for <b>CheckPoint</b>.
 * 
 * Resource DLLs initially set <b>CheckPoint</b> to zero, then increment it by 1 for each call 
 *      to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_resource_status_routine">SetResourceStatus</a>. 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitors</a> detect new status reports by comparing 
 *      the current value of <b>CheckPoint</b> to the previous value. If the value has changed, the 
 *      Resource Monitor reads the new status information.
 * 
 * Before returning the <b>ClusterResourceUnknown</b> state in the 
 *      <b>ResourceState</b> member, a resource DLL should call the function 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a>.
 * 
 * Resource DLLs set the <b>EventHandle</b> member to a handle that is signaled when a 
 *      resource fails.
 * 
 * For more information, see 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-resource-dlls">Implementing Resource DLLs</a>.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-resource_status
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct RESOURCE_STATUS {
    #StructPack 8

    /**
     * A value describing the state of a resource enumerated by the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_state">CLUSTER_RESOURCE_STATE</a> enumeration.  The possible values for this member are as follows:
     */
    ResourceState : CLUSTER_RESOURCE_STATE

    /**
     * A value set by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">resource DLL</a> to flag a status 
     *       report as new.
     */
    CheckPoint : UInt32

    /**
     * This member is not being used at this time.
     */
    WaitHint : UInt32

    /**
     * Handle to an event that indicates when the resource has failed.
     */
    EventHandle : HANDLE

}
