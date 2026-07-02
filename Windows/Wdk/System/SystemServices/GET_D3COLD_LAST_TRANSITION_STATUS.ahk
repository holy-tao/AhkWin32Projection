#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3COLD_LAST_TRANSITION_STATUS.ahk" { D3COLD_LAST_TRANSITION_STATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct GET_D3COLD_LAST_TRANSITION_STATUS {
    value : IntPtr

    __value {
        set {
            if (value is GET_D3COLD_LAST_TRANSITION_STATUS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<D3COLD_LAST_TRANSITION_STATUS>} LastTransitionStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Context, LastTransitionStatus) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        LastTransitionStatusMarshal := LastTransitionStatus is VarRef ? "int*" : "ptr"

        DllCall(this.value, _ContextMarshal, _Context, LastTransitionStatusMarshal, LastTransitionStatus)
    }

    /**
     * A GET_D3COLD_LAST_TRANSITION_STATUS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GET_D3COLD_LAST_TRANSITION_STATUS {
        /**
         * Creates a GET_D3COLD_LAST_TRANSITION_STATUS pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "int*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "int*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
