#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAX_EXT_FREE_BUFFER {
    value : IntPtr

    __value {
        set {
            if (value is PFAX_EXT_FREE_BUFFER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, param0Marshal, param0)
    }

    /**
     * A PFAX_EXT_FREE_BUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAX_EXT_FREE_BUFFER {
        /**
         * Creates a PFAX_EXT_FREE_BUFFER pointer that invokes the given AHK function when called.
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
