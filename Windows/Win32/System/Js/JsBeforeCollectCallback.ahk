#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Js
 */
export default struct JsBeforeCollectCallback {
    value : IntPtr

    __value {
        set {
            if (value is JsBeforeCollectCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} callbackState 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(callbackState) {
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"

        DllCall(this.value, callbackStateMarshal, callbackState)
    }

    /**
     * A JsBeforeCollectCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends JsBeforeCollectCallback {
        /**
         * Creates a JsBeforeCollectCallback pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
