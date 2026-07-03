#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct PFN_AUTHZ_FREE_CENTRAL_ACCESS_POLICY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_AUTHZ_FREE_CENTRAL_ACCESS_POLICY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pCentralAccessPolicy 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pCentralAccessPolicy) {
        pCentralAccessPolicyMarshal := pCentralAccessPolicy is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pCentralAccessPolicyMarshal, pCentralAccessPolicy)
    }

    /**
     * A PFN_AUTHZ_FREE_CENTRAL_ACCESS_POLICY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_AUTHZ_FREE_CENTRAL_ACCESS_POLICY {
        /**
         * Creates a PFN_AUTHZ_FREE_CENTRAL_ACCESS_POLICY pointer that invokes the given AHK function when called.
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
