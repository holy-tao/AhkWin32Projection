#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct PTLS_CALLBACK_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is PTLS_CALLBACK_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} __MIDL____MIDL_itf_mscoree_0000_00040005 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(__MIDL____MIDL_itf_mscoree_0000_00040005) {
        __MIDL____MIDL_itf_mscoree_0000_00040005Marshal := __MIDL____MIDL_itf_mscoree_0000_00040005 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, __MIDL____MIDL_itf_mscoree_0000_00040005Marshal, __MIDL____MIDL_itf_mscoree_0000_00040005)
    }

    /**
     * A PTLS_CALLBACK_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PTLS_CALLBACK_FUNCTION {
        /**
         * Creates a PTLS_CALLBACK_FUNCTION pointer that invokes the given AHK function when called.
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
