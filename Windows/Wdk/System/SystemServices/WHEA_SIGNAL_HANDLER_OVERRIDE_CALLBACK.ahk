#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_SIGNAL_HANDLER_OVERRIDE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WHEA_SIGNAL_HANDLER_OVERRIDE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    Call() {
        result := DllCall(this.value, BOOLEAN)
        return result
    }

    /**
     * A WHEA_SIGNAL_HANDLER_OVERRIDE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WHEA_SIGNAL_HANDLER_OVERRIDE_CALLBACK {
        /**
         * Creates a WHEA_SIGNAL_HANDLER_OVERRIDE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func() => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
