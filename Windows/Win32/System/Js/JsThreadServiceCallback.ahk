#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JsBackgroundWorkItemCallback.ahk" { JsBackgroundWorkItemCallback }

/**
 * @namespace Windows.Win32.System.Js
 */
export default struct JsThreadServiceCallback {
    value : IntPtr

    __value {
        set {
            if (value is JsThreadServiceCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<JsBackgroundWorkItemCallback>} callback 
     * @param {Pointer<Void>} callbackState 
     * @returns {Boolean} 
     */
    Call(callback, callbackState) {
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, JsBackgroundWorkItemCallback, callback, callbackStateMarshal, callbackState, Int32)
        return result
    }

    /**
     * A JsThreadServiceCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends JsThreadServiceCallback {
        /**
         * Creates a JsThreadServiceCallback pointer that invokes the given AHK function when called.
         * @param {Func(JsBackgroundWorkItemCallback, "ptr") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [JsBackgroundWorkItemCallback, "ptr", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
