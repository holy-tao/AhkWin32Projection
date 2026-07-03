#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct W_CO_ACTIVATE_VC_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is W_CO_ACTIVATE_VC_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {Integer} 
     */
    Call() {
        result := DllCall(this.value, Int32)
        return result
    }

    /**
     * A W_CO_ACTIVATE_VC_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends W_CO_ACTIVATE_VC_HANDLER {
        /**
         * Creates a W_CO_ACTIVATE_VC_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func() => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
