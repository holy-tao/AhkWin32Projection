#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PDEBUG_EXTENSION_NOTIFY {
    value : IntPtr

    __value {
        set {
            if (value is PDEBUG_EXTENSION_NOTIFY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} Notify 
     * @param {Integer} Argument 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Notify, Argument) {
        DllCall(this.value, UInt32, Notify, Int64, Argument)
    }

    /**
     * A PDEBUG_EXTENSION_NOTIFY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDEBUG_EXTENSION_NOTIFY {
        /**
         * Creates a PDEBUG_EXTENSION_NOTIFY pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, Int64) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, Int64, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
