#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct WAITORTIMERCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WAITORTIMERCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {BOOLEAN} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, param0Marshal, param0, BOOLEAN, param1)
    }

    /**
     * A WAITORTIMERCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WAITORTIMERCALLBACK {
        /**
         * Creates a WAITORTIMERCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", BOOLEAN) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BOOLEAN, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
