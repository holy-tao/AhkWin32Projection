#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The PONLINE_ROUTINE callback function marks a resource as available for use. (PONLINE_ROUTINE)
 * @remarks
 * If the <b>Online</b> entry-point function returns an error code 
 *      other than <b>ERROR_IO_PENDING</b>, the Resource Monitor logs an event and calls 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pterminate_routine">Terminate</a>.
 * 
 * Returning a valid <i>EventHandle</i> yields the following benefits:
 * 
 * <ul>
 * <li>The Resource Monitor will not perform <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plooks_alive_routine">LooksAlive</a> 
 *       polling. Avoiding this overhead is often useful, particularly when your DLL supports multiple resource 
 *       instances.</li>
 * <li>You can report resource failure at any time by signaling the handle. The Resource Monitor will immediately 
 *       call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pis_alive_routine">IsAlive</a> to verify that the resource has failed.</li>
 * </ul>
 * For effective implementation strategies of the <i>Online</i> 
 *     entry-point function, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-online">Implementing Online</a>.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-ponline_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PONLINE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PONLINE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Resource Resource identifier for the resource to be made available.
     * @param {Pointer<HANDLE>} EventHandle On input, <i>EventHandle</i> is <b>NULL</b>. On output, 
     *        <i>EventHandle</i> contains a handle to a nonsignaled 
     *        <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-objects">synchronization object</a>. The 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">resource DLL</a> can signal this handle at any time to report 
     *        a resource failure to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitor</a>. 
     *        <i>EventHandle</i> can also be set to <b>NULL</b> on output, indicating 
     *        that the resource does not support asynchronous event notification.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful, and the resource is now 
     *          <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/o-gly">online</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RESOURCE_NOT_AVAILABLE</b></dt>
     * <dt>5006 (0x138E)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource was arbitrated with some other systems, and one of the other systems won the arbitration. Only 
     *          <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/q-gly">quorum-capable resources</a> return this 
     *          value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * <dt>997 (0x3E5)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is pending, and a thread has been activated to process the online request.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the operation was not successful for other reasons, 
     *        <i>Online</i> should return one of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     */
    Call(Resource, EventHandle) {
        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, ResourceMarshal, Resource, HANDLE.Ptr, EventHandle, UInt32)
        return result
    }

    /**
     * A PONLINE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PONLINE_ROUTINE {
        /**
         * Creates a PONLINE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", HANDLE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", HANDLE.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
