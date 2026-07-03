#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RESOURCE_STATUS.ahk" { RESOURCE_STATUS }

/**
 * The PSET_RESOURCE_STATUS_ROUTINE callback function is called to update the status of a resource.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">Resource DLLs</a> call the 
 *      <i>SetResourceStatus</i> callback function to update the 
 *      status of a resource after their <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_routine">Online</a> or 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> entry point function has returned 
 *      <b>ERROR_IO_PENDING</b>. It should not be called at any other time. A pointer to the 
 *      <i>SetResourceStatus</i> function is passed in the 
 *      <i>SetResourceStatus</i> parameter to the resource's implementation of 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pstartup_routine">Startup</a>.
 * 
 * <i>SetResourceStatus</i> is implemented by the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitor</a> and is similar to the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> function.
 * 
 * Update the current state of a resource whenever necessary after you have returned 
 *      <b>ERROR_IO_PENDING</b>. If the resource is in one of the pending states, increment the values 
 *      for the <b>CheckPoint</b> and <b>WaitHint</b> members of the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resource_status">RESOURCE_STATUS</a> structure and set the 
 *      <b>ResourceState</b> member to <b>ClusterResourceOnlinePending</b> or 
 *      <b>ClusterResourceOfflinePending</b> before you begin calling 
 *      <i>SetResourceStatus</i>. Call 
 *      <i>SetResourceStatus</i> until one of the following 
 *      situations occurs:
 * 
 * <ul>
 * <li>The resource is placed in either the <b>ClusterResourceOnline</b> or 
 *       <b>ClusterResourceOffline</b> state.</li>
 * <li>The time limit stored in the resource's 
 *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources-pendingtimeout">PendingTimeout</a> property has been 
 *       exceeded.</li>
 * </ul>
 * There is no need to call 
 *      <i>SetResourceStatus</i> to set the state of a resource to 
 *      a pending state because the Resource Monitor automatically sets it to the appropriate pending state whenever 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_routine">Online</a> or 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> returns 
 *      <b>ERROR_IO_PENDING</b>.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-pset_resource_status_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PSET_RESOURCE_STATUS_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PSET_RESOURCE_STATUS_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ResourceHandle Handle identifying the resource to be updated. The <i>ResourceHandle</i> parameter should 
     *        contain the same handle used for the <i>ResourceHandle</i> parameter in the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-popen_routine">Open</a> entry point for this resource.
     * @param {Pointer<RESOURCE_STATUS>} ResourceStatus Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resource_status">RESOURCE_STATUS</a> structure that 
     *        contains information about the resource's state.
     * @returns {Integer} <i>SetResourceStatus</i> returns one of 
     *        the following values enumerated from the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/resapi/ne-resapi-resource_exit_state">RESOURCE_EXIT_STATE</a> enumeration.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ResourceExitStateContinue</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource has not been terminated. Worker threads may continue 
     *          <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_routine">Online</a> and 
     *          <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> operations for the resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ResourceExitStateTerminate</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource has been terminated. Callers should end 
     *          <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_routine">Online</a> or 
     *          <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> operations and immediately terminate all worker 
     *          threads assigned to the resource.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(ResourceHandle, ResourceStatus) {
        result := DllCall(this.value, IntPtr, ResourceHandle, RESOURCE_STATUS.Ptr, ResourceStatus, UInt32)
        return result
    }

    /**
     * A PSET_RESOURCE_STATUS_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSET_RESOURCE_STATUS_ROUTINE {
        /**
         * Creates a PSET_RESOURCE_STATUS_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, RESOURCE_STATUS) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, RESOURCE_STATUS.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
