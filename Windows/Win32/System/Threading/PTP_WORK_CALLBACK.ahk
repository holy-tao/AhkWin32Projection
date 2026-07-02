#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PTP_WORK.ahk" { PTP_WORK }
#Import ".\PTP_CALLBACK_INSTANCE.ahk" { PTP_CALLBACK_INSTANCE }

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct PTP_WORK_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PTP_WORK_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PTP_CALLBACK_INSTANCE} Instance 
     * @param {Pointer<Void>} _Context 
     * @param {PTP_WORK} Work 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Instance, _Context, Work) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, PTP_CALLBACK_INSTANCE, Instance, _ContextMarshal, _Context, PTP_WORK, Work)
    }

    /**
     * A PTP_WORK_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PTP_WORK_CALLBACK {
        /**
         * Creates a PTP_WORK_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PTP_CALLBACK_INSTANCE, "ptr", PTP_WORK) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PTP_CALLBACK_INSTANCE, "ptr", PTP_WORK, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
