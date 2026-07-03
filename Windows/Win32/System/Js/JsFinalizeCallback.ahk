#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Js
 */
export default struct JsFinalizeCallback {
    value : IntPtr

    __value {
        set {
            if (value is JsFinalizeCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} data 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(data) {
        dataMarshal := data is VarRef ? "ptr" : "ptr"

        DllCall(this.value, dataMarshal, data)
    }

    /**
     * A JsFinalizeCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends JsFinalizeCallback {
        /**
         * Creates a JsFinalizeCallback pointer that invokes the given AHK function when called.
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
