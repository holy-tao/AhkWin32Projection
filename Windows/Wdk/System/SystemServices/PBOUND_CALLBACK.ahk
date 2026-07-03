#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BOUND_CALLBACK_STATUS.ahk" { BOUND_CALLBACK_STATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PBOUND_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PBOUND_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {BOUND_CALLBACK_STATUS} 
     */
    Call() {
        result := DllCall(this.value, BOUND_CALLBACK_STATUS)
        return result
    }

    /**
     * A PBOUND_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PBOUND_CALLBACK {
        /**
         * Creates a PBOUND_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func() => BOUND_CALLBACK_STATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BOUND_CALLBACK_STATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
