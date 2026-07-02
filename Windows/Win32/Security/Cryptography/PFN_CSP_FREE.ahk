#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CSP_FREE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CSP_FREE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Address 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Address) {
        _AddressMarshal := _Address is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _AddressMarshal, _Address)
    }

    /**
     * A PFN_CSP_FREE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CSP_FREE {
        /**
         * Creates a PFN_CSP_FREE pointer that invokes the given AHK function when called.
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
