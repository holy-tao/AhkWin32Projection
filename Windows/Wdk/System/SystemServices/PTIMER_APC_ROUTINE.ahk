#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PTIMER_APC_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PTIMER_APC_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} TimerContext 
     * @param {Integer} TimerLowValue 
     * @param {Integer} TimerHighValue 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(TimerContext, TimerLowValue, TimerHighValue) {
        TimerContextMarshal := TimerContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, TimerContextMarshal, TimerContext, UInt32, TimerLowValue, Int32, TimerHighValue)
    }

    /**
     * A PTIMER_APC_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PTIMER_APC_ROUTINE {
        /**
         * Creates a PTIMER_APC_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, Int32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, Int32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
