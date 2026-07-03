#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PFIBER_CALLOUT_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PFIBER_CALLOUT_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} lpParameter 
     * @returns {Pointer<Void>} 
     */
    Call(lpParameter) {
        lpParameterMarshal := lpParameter is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, lpParameterMarshal, lpParameter, IntPtr)
        return result
    }

    /**
     * A PFIBER_CALLOUT_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFIBER_CALLOUT_ROUTINE {
        /**
         * Creates a PFIBER_CALLOUT_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
