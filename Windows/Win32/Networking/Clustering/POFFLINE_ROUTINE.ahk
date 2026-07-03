#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The POFFLINE_ROUTINE callback function marks a resource as unavailable for use after cleanup processing is complete.
 * @remarks
 * If <i>Offline</i> returns an error code other than 
 *      <b>ERROR_IO_PENDING</b>, the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitor</a> logs an event and calls 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pterminate_routine">Terminate</a>.
 * 
 * For effective implementation strategies of the <i>Offline</i> 
 *      entry-point function, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-offline">Implementing Offline</a>.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-poffline_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct POFFLINE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is POFFLINE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Resource Resource identifier for the resource to be taken offline.
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
     * The request completed successfully, and the resource is offline.
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
     * The request is still pending, and a thread has been activated to process the offline request.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the operation was not successful for other reasons, 
     *        <i>Offline</i> should return one of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     */
    Call(Resource) {
        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, ResourceMarshal, Resource, UInt32)
        return result
    }

    /**
     * A POFFLINE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends POFFLINE_ROUTINE {
        /**
         * Creates a POFFLINE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
