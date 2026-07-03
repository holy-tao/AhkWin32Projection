#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_PROXY_COMPLETION_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is DNS_PROXY_COMPLETION_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} completionContext 
     * @param {Integer} _status 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(completionContext, _status) {
        completionContextMarshal := completionContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, completionContextMarshal, completionContext, Int32, _status)
    }

    /**
     * A DNS_PROXY_COMPLETION_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DNS_PROXY_COMPLETION_ROUTINE {
        /**
         * Creates a DNS_PROXY_COMPLETION_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
