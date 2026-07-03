#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\SystemServices\RTL_UMS_SCHEDULER_REASON.ahk" { RTL_UMS_SCHEDULER_REASON }

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct PRTL_UMS_SCHEDULER_ENTRY_POINT {
    value : IntPtr

    __value {
        set {
            if (value is PRTL_UMS_SCHEDULER_ENTRY_POINT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {RTL_UMS_SCHEDULER_REASON} Reason 
     * @param {Pointer} ActivationPayload 
     * @param {Pointer<Void>} SchedulerParam 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Reason, ActivationPayload, SchedulerParam) {
        SchedulerParamMarshal := SchedulerParam is VarRef ? "ptr" : "ptr"

        DllCall(this.value, RTL_UMS_SCHEDULER_REASON, Reason, IntPtr, ActivationPayload, SchedulerParamMarshal, SchedulerParam)
    }

    /**
     * A PRTL_UMS_SCHEDULER_ENTRY_POINT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRTL_UMS_SCHEDULER_ENTRY_POINT {
        /**
         * Creates a PRTL_UMS_SCHEDULER_ENTRY_POINT pointer that invokes the given AHK function when called.
         * @param {Func(RTL_UMS_SCHEDULER_REASON, IntPtr, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RTL_UMS_SCHEDULER_REASON, IntPtr, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
