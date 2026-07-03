#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_FREE_LSA_HEAP {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_FREE_LSA_HEAP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Base 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Base) {
        BaseMarshal := Base is VarRef ? "ptr" : "ptr"

        DllCall(this.value, BaseMarshal, Base)
    }

    /**
     * A PLSA_FREE_LSA_HEAP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_FREE_LSA_HEAP {
        /**
         * Creates a PLSA_FREE_LSA_HEAP pointer that invokes the given AHK function when called.
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
