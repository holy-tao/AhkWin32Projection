#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct CM_MAKE_CALL_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is CM_MAKE_CALL_HANDLER) {
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
     * A CM_MAKE_CALL_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CM_MAKE_CALL_HANDLER {
        /**
         * Creates a CM_MAKE_CALL_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func() => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
