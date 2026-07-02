#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_FREE_BUFFER {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXT_FREE_BUFFER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvMemory 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pvMemory) {
        pvMemoryMarshal := pvMemory is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pvMemoryMarshal, pvMemory)
    }

    /**
     * A DOT11EXT_FREE_BUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXT_FREE_BUFFER {
        /**
         * Creates a DOT11EXT_FREE_BUFFER pointer that invokes the given AHK function when called.
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
