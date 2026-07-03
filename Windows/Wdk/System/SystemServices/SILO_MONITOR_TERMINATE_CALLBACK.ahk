#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PESILO.ahk" { PESILO }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SILO_MONITOR_TERMINATE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is SILO_MONITOR_TERMINATE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PESILO} Silo 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Silo) {
        DllCall(this.value, PESILO, Silo)
    }

    /**
     * A SILO_MONITOR_TERMINATE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SILO_MONITOR_TERMINATE_CALLBACK {
        /**
         * Creates a SILO_MONITOR_TERMINATE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PESILO) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PESILO, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
