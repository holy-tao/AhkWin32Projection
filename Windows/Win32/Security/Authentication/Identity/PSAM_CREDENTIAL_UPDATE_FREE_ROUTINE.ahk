#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PSAM_CREDENTIAL_UPDATE_FREE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PSAM_CREDENTIAL_UPDATE_FREE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} p 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(p) {
        pMarshal := p is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pMarshal, p)
    }

    /**
     * A PSAM_CREDENTIAL_UPDATE_FREE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSAM_CREDENTIAL_UPDATE_FREE_ROUTINE {
        /**
         * Creates a PSAM_CREDENTIAL_UPDATE_FREE_ROUTINE pointer that invokes the given AHK function when called.
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
