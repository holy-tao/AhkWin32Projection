#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct EXPAND_STACK_CALLOUT {
    value : IntPtr

    __value {
        set {
            if (value is EXPAND_STACK_CALLOUT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Parameter 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Parameter) {
        ParameterMarshal := Parameter is VarRef ? "ptr" : "ptr"

        DllCall(this.value, ParameterMarshal, Parameter)
    }

    /**
     * A EXPAND_STACK_CALLOUT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXPAND_STACK_CALLOUT {
        /**
         * Creates a EXPAND_STACK_CALLOUT pointer that invokes the given AHK function when called.
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
