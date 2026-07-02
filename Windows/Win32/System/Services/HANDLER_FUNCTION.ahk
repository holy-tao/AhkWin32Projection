#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Services
 */
export default struct HANDLER_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is HANDLER_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwControl 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(dwControl) {
        DllCall(this.value, UInt32, dwControl)
    }

    /**
     * A HANDLER_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends HANDLER_FUNCTION {
        /**
         * Creates a HANDLER_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func(UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
