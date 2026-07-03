#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct APPLICATION_RECOVERY_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is APPLICATION_RECOVERY_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvParameter 
     * @returns {Integer} 
     */
    Call(pvParameter) {
        pvParameterMarshal := pvParameter is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvParameterMarshal, pvParameter, UInt32)
        return result
    }

    /**
     * A APPLICATION_RECOVERY_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends APPLICATION_RECOVERY_CALLBACK {
        /**
         * Creates a APPLICATION_RECOVERY_CALLBACK pointer that invokes the given AHK function when called.
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
