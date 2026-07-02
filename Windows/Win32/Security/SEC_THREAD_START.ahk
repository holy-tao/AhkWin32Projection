#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security
 */
export default struct SEC_THREAD_START {
    value : IntPtr

    __value {
        set {
            if (value is SEC_THREAD_START) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} lpThreadParameter 
     * @returns {Integer} 
     */
    Call(lpThreadParameter) {
        lpThreadParameterMarshal := lpThreadParameter is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, lpThreadParameterMarshal, lpThreadParameter, UInt32)
        return result
    }

    /**
     * A SEC_THREAD_START that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SEC_THREAD_START {
        /**
         * Creates a SEC_THREAD_START pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
