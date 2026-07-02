#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_FREE_SHARED_MEMORY {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_FREE_SHARED_MEMORY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} SharedMem 
     * @param {Pointer<Void>} Memory 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(SharedMem, Memory) {
        SharedMemMarshal := SharedMem is VarRef ? "ptr" : "ptr"
        MemoryMarshal := Memory is VarRef ? "ptr" : "ptr"

        DllCall(this.value, SharedMemMarshal, SharedMem, MemoryMarshal, Memory)
    }

    /**
     * A PLSA_FREE_SHARED_MEMORY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_FREE_SHARED_MEMORY {
        /**
         * Creates a PLSA_FREE_SHARED_MEMORY pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
