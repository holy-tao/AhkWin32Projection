#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Js
 */
export default struct JsNativeFunction {
    value : IntPtr

    __value {
        set {
            if (value is JsNativeFunction) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} callee 
     * @param {Boolean} isConstructCall 
     * @param {Pointer<Pointer<Void>>} arguments 
     * @param {Integer} argumentCount 
     * @param {Pointer<Void>} callbackState 
     * @returns {Pointer<Void>} 
     */
    Call(callee, isConstructCall, arguments, argumentCount, callbackState) {
        calleeMarshal := callee is VarRef ? "ptr" : "ptr"
        argumentsMarshal := arguments is VarRef ? "ptr*" : "ptr"
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, calleeMarshal, callee, Int32, isConstructCall, argumentsMarshal, arguments, UInt16, argumentCount, callbackStateMarshal, callbackState, IntPtr)
        return result
    }

    /**
     * A JsNativeFunction that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends JsNativeFunction {
        /**
         * Creates a JsNativeFunction pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int32, "ptr*", UInt16, "ptr") => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int32, "ptr*", UInt16, "ptr", "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
