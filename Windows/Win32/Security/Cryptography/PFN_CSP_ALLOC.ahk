#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CSP_ALLOC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CSP_ALLOC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} _Size 
     * @returns {Pointer<Void>} 
     */
    Call(_Size) {
        result := DllCall(this.value, IntPtr, _Size, IntPtr)
        return result
    }

    /**
     * A PFN_CSP_ALLOC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CSP_ALLOC {
        /**
         * Creates a PFN_CSP_ALLOC pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
