#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PSECURE_DRIVER_PROCESS_DEREFERENCE {
    value : IntPtr

    __value {
        set {
            if (value is PSECURE_DRIVER_PROCESS_DEREFERENCE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Call() {
        DllCall(this.value)
    }

    /**
     * A PSECURE_DRIVER_PROCESS_DEREFERENCE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSECURE_DRIVER_PROCESS_DEREFERENCE {
        /**
         * Creates a PSECURE_DRIVER_PROCESS_DEREFERENCE pointer that invokes the given AHK function when called.
         * @param {Func() => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
