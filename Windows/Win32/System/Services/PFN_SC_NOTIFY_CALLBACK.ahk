#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Services
 */
export default struct PFN_SC_NOTIFY_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFN_SC_NOTIFY_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pParameter 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pParameter) {
        pParameterMarshal := pParameter is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pParameterMarshal, pParameter)
    }

    /**
     * A PFN_SC_NOTIFY_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_SC_NOTIFY_CALLBACK {
        /**
         * Creates a PFN_SC_NOTIFY_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
