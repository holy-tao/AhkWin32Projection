#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Immediately marks a resource as unavailable for use without waiting for cleanup processing to be completed.
 * @remarks
 * The <i>Terminate</i> entry-point function instantly marks a 
 *      resource as unavailable for use. If there is a thread processing an 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_routine">Online</a> or 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> request for the resource, these requests are canceled 
 *      and the resource is taken offline immediately.
 * 
 * For effective implementation strategies of the <i>Terminate</i> 
 *      entry-point function, see 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-terminate">Implementing Terminate</a>.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-pterminate_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PTERMINATE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PTERMINATE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Resource Resource identifier for the resource to be made unavailable.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Resource) {
        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"

        DllCall(this.value, ResourceMarshal, Resource)
    }

    /**
     * A PTERMINATE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PTERMINATE_ROUTINE {
        /**
         * Creates a PTERMINATE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
