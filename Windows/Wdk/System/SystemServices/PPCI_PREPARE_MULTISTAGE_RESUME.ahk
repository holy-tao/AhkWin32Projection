#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PPCI_PREPARE_MULTISTAGE_RESUME {
    value : IntPtr

    __value {
        set {
            if (value is PPCI_PREPARE_MULTISTAGE_RESUME) {
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
     * A PPCI_PREPARE_MULTISTAGE_RESUME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PPCI_PREPARE_MULTISTAGE_RESUME {
        /**
         * Creates a PPCI_PREPARE_MULTISTAGE_RESUME pointer that invokes the given AHK function when called.
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
