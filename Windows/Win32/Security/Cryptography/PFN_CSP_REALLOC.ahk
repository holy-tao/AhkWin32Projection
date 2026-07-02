#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CSP_REALLOC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CSP_REALLOC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Address 
     * @param {Pointer} _Size 
     * @returns {Pointer<Void>} 
     */
    Call(_Address, _Size) {
        _AddressMarshal := _Address is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _AddressMarshal, _Address, IntPtr, _Size, IntPtr)
        return result
    }

    /**
     * A PFN_CSP_REALLOC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CSP_REALLOC {
        /**
         * Creates a PFN_CSP_REALLOC pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
