#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PALLOCATE_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is PALLOCATE_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    Call() {
        result := DllCall(this.value, IntPtr)
        return result
    }

    /**
     * A PALLOCATE_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PALLOCATE_FUNCTION {
        /**
         * Creates a PALLOCATE_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func() => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
