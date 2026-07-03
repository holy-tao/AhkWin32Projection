#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_CancellationReason.ahk" { MI_CancellationReason }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_CancelCallback {
    value : IntPtr

    __value {
        set {
            if (value is MI_CancelCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {MI_CancellationReason} reason 
     * @param {Pointer<Void>} callbackData 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(reason, callbackData) {
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, MI_CancellationReason, reason, callbackDataMarshal, callbackData)
    }

    /**
     * A MI_CancelCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MI_CancelCallback {
        /**
         * Creates a MI_CancelCallback pointer that invokes the given AHK function when called.
         * @param {Func(MI_CancellationReason, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [MI_CancellationReason, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
