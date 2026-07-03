#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Closes a resource.
 * @remarks
 * For effective implementation strategies of the <b>Close</b> 
 *      entry-point function, see 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-close">Implementing Close</a>.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-pclose_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLOSE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PCLOSE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Resource 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Resource) {
        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"

        DllCall(this.value, ResourceMarshal, Resource)
    }

    /**
     * A PCLOSE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLOSE_ROUTINE {
        /**
         * Creates a PCLOSE_ROUTINE pointer that invokes the given AHK function when called.
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
