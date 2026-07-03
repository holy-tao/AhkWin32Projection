#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RESOURCE_STATUS_EX.ahk" { RESOURCE_STATUS_EX }

/**
 * The PSET_RESOURCE_STATUS_ROUTINE_EX callback function is called to update the status of a resource. (PSET_RESOURCE_STATUS_ROUTINE_EX)
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-pset_resource_status_routine_ex
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PSET_RESOURCE_STATUS_ROUTINE_EX {
    value : IntPtr

    __value {
        set {
            if (value is PSET_RESOURCE_STATUS_ROUTINE_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ResourceHandle A handle to the resource to be updated. The <i>ResourceHandle</i> parameter should 
     *        contain the same handle that is used for the <i>ResourceHandle</i> parameter in the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-popen_v2_routine">OpenV2</a> entry point for this resource.
     * @param {Pointer<RESOURCE_STATUS_EX>} ResourceStatus A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resource_status_ex">RESOURCE_STATUS_EX</a> structure that 
     *        contains information about the resource's state.
     * @returns {Integer} One of 
     *        the following values of the 
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
     * The resource has not been terminated. Worker threads can  continue 
     *          <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_v2_routine">OnlineV2</a> and 
     *          <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_v2_routine">OfflineV2</a> operations for the resource.
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
     *          <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_v2_routine">OnlineV2</a> or 
     *          <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_v2_routine">OfflineV2</a> operations and immediately terminate all worker 
     *          threads that are assigned to the resource.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(ResourceHandle, ResourceStatus) {
        result := DllCall(this.value, IntPtr, ResourceHandle, RESOURCE_STATUS_EX.Ptr, ResourceStatus, UInt32)
        return result
    }

    /**
     * A PSET_RESOURCE_STATUS_ROUTINE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSET_RESOURCE_STATUS_ROUTINE_EX {
        /**
         * Creates a PSET_RESOURCE_STATUS_ROUTINE_EX pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, RESOURCE_STATUS_EX) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, RESOURCE_STATUS_EX.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
