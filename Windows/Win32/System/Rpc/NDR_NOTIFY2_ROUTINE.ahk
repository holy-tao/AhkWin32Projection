#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR_NOTIFY2_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is NDR_NOTIFY2_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} flag 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(flag) {
        DllCall(this.value, Int8, flag)
    }

    /**
     * A NDR_NOTIFY2_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NDR_NOTIFY2_ROUTINE {
        /**
         * Creates a NDR_NOTIFY2_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(Int8) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int8, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
