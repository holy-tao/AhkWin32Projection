#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PVIDEO_WIN32K_CALLOUT {
    value : IntPtr

    __value {
        set {
            if (value is PVIDEO_WIN32K_CALLOUT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Params 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Params) {
        ParamsMarshal := Params is VarRef ? "ptr" : "ptr"

        DllCall(this.value, ParamsMarshal, Params)
    }

    /**
     * A PVIDEO_WIN32K_CALLOUT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PVIDEO_WIN32K_CALLOUT {
        /**
         * Creates a PVIDEO_WIN32K_CALLOUT pointer that invokes the given AHK function when called.
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
