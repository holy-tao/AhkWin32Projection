#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct _WHEA_SIGNAL_HANDLER_OVERRIDE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is _WHEA_SIGNAL_HANDLER_OVERRIDE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} _Context 
     * @returns {BOOLEAN} 
     */
    Call(_Context) {
        result := DllCall(this.value, IntPtr, _Context, BOOLEAN)
        return result
    }

    /**
     * A _WHEA_SIGNAL_HANDLER_OVERRIDE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends _WHEA_SIGNAL_HANDLER_OVERRIDE_CALLBACK {
        /**
         * Creates a _WHEA_SIGNAL_HANDLER_OVERRIDE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, BOOLEAN])
        }

        __Delete() => CallbackFree(this.value)
    }
}
