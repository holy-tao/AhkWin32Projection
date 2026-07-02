#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct PFREE_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is PFREE_FUNCTION) {
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
     * A PFREE_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFREE_FUNCTION {
        /**
         * Creates a PFREE_FUNCTION pointer that invokes the given AHK function when called.
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
