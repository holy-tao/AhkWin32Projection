#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Application-defined callback function used with the RegisterWaitUntilOOBECompleted function.
 * @remarks
 * Once the callback function has completed, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oobenotification/nf-oobenotification-unregisterwaituntiloobecompleted">UnregisterWaitUntilOOBECompleted</a> should be called.
 * @see https://learn.microsoft.com/windows/win32/api/oobenotification/nc-oobenotification-oobe_completed_callback
 * @namespace Windows.Win32.System.SetupAndMigration
 */
export default struct OOBE_COMPLETED_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is OOBE_COMPLETED_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} CallbackContext Pointer to the callback context. This is the value passed to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oobenotification/nf-oobenotification-registerwaituntiloobecompleted">RegisterWaitUntilOOBECompleted</a> function as the <i>CallbackContext</i> parameter.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CallbackContext) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, CallbackContextMarshal, CallbackContext)
    }

    /**
     * A OOBE_COMPLETED_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends OOBE_COMPLETED_CALLBACK {
        /**
         * Creates a OOBE_COMPLETED_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
