#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The PONLINE_V2_ROUTINE callback function marks a resource as available for use. (PONLINE_V2_ROUTINE)
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-ponline_v2_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PONLINE_V2_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PONLINE_V2_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Resource A resource identifier for the resource to be made available.
     * @param {Pointer<HANDLE>} EventHandle On input, <i>EventHandle</i> is <b>NULL</b>. On output, 
     *        <i>EventHandle</i> contains a handle to a non signaled 
     *        <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-objects">synchronization object</a>. The 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">resource DLL</a> can signal this handle at any time to report 
     *        a resource failure to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitor</a>. 
     *        <i>EventHandle</i> can also be set to <b>NULL</b> on output, which indicates 
     *        that the resource does not support asynchronous event notifications.
     * @param {Integer} OnlineFlags 
     * @param {Integer} InBuffer A pointer to a buffer that contains  data for the operation; otherwise <b>NULL</b> if the operation does not require data.
     * @param {Integer} InBufferSize The size of the <i>InBuffer</i> parameter, in bytes.
     * @param {Integer} Reserved Reserved.
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
     * The operation was successful, and the resource is online.
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
     *        a 
     *        system error code is returned.
     */
    Call(Resource, EventHandle, OnlineFlags, InBuffer, InBufferSize, Reserved) {
        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, ResourceMarshal, Resource, HANDLE.Ptr, EventHandle, UInt32, OnlineFlags, IntPtr, InBuffer, UInt32, InBufferSize, UInt32, Reserved, UInt32)
        return result
    }

    /**
     * A PONLINE_V2_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PONLINE_V2_ROUTINE {
        /**
         * Creates a PONLINE_V2_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", HANDLE, UInt32, IntPtr, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", HANDLE.Ptr, UInt32, IntPtr, UInt32, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
