#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct LPTHREAD_START_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is LPTHREAD_START_ROUTINE) {
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
     * A LPTHREAD_START_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPTHREAD_START_ROUTINE {
        /**
         * Creates a LPTHREAD_START_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
