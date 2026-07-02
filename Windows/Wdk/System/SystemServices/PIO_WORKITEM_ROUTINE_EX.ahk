#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PIO_WORKITEM_ROUTINE_EX {
    value : IntPtr

    __value {
        set {
            if (value is PIO_WORKITEM_ROUTINE_EX) {
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
     * A PIO_WORKITEM_ROUTINE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIO_WORKITEM_ROUTINE_EX {
        /**
         * Creates a PIO_WORKITEM_ROUTINE_EX pointer that invokes the given AHK function when called.
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
