#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PTP_WAIT.ahk" { PTP_WAIT }
#Import ".\PTP_CALLBACK_INSTANCE.ahk" { PTP_CALLBACK_INSTANCE }

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct PTP_WAIT_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PTP_WAIT_CALLBACK) {
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
     * @param {PTP_WAIT} Wait 
     * @param {Integer} WaitResult 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Instance, _Context, Wait, WaitResult) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, PTP_CALLBACK_INSTANCE, Instance, _ContextMarshal, _Context, PTP_WAIT, Wait, UInt32, WaitResult)
    }

    /**
     * A PTP_WAIT_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PTP_WAIT_CALLBACK {
        /**
         * Creates a PTP_WAIT_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PTP_CALLBACK_INSTANCE, "ptr", PTP_WAIT, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PTP_CALLBACK_INSTANCE, "ptr", PTP_WAIT, UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
