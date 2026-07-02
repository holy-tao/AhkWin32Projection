#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CMSG_ALLOC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CMSG_ALLOC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} cb 
     * @returns {Pointer<Void>} 
     */
    Call(cb) {
        result := DllCall(this.value, IntPtr, cb, IntPtr)
        return result
    }

    /**
     * A PFN_CMSG_ALLOC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CMSG_ALLOC {
        /**
         * Creates a PFN_CMSG_ALLOC pointer that invokes the given AHK function when called.
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
