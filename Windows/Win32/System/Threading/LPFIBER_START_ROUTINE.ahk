#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct LPFIBER_START_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is LPFIBER_START_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} lpFiberParameter 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(lpFiberParameter) {
        lpFiberParameterMarshal := lpFiberParameter is VarRef ? "ptr" : "ptr"

        DllCall(this.value, lpFiberParameterMarshal, lpFiberParameter)
    }

    /**
     * A LPFIBER_START_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFIBER_START_ROUTINE {
        /**
         * Creates a LPFIBER_START_ROUTINE pointer that invokes the given AHK function when called.
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
