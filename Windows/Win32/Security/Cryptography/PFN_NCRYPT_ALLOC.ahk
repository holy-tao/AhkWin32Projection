#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_NCRYPT_ALLOC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_NCRYPT_ALLOC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} cbSize 
     * @returns {Pointer<Void>} 
     */
    Call(cbSize) {
        result := DllCall(this.value, IntPtr, cbSize, IntPtr)
        return result
    }

    /**
     * A PFN_NCRYPT_ALLOC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_NCRYPT_ALLOC {
        /**
         * Creates a PFN_NCRYPT_ALLOC pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
