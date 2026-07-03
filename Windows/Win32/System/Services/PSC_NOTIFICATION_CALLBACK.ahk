#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Services
 */
export default struct PSC_NOTIFICATION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PSC_NOTIFICATION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwNotify 
     * @param {Pointer<Void>} pCallbackContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(dwNotify, pCallbackContext) {
        pCallbackContextMarshal := pCallbackContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, UInt32, dwNotify, pCallbackContextMarshal, pCallbackContext)
    }

    /**
     * A PSC_NOTIFICATION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSC_NOTIFICATION_CALLBACK {
        /**
         * Creates a PSC_NOTIFICATION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
