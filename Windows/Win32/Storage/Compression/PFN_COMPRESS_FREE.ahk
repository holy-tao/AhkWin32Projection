#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Compression
 */
export default struct PFN_COMPRESS_FREE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_COMPRESS_FREE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} UserContext 
     * @param {Pointer<Void>} Memory 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(UserContext, Memory) {
        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"
        MemoryMarshal := Memory is VarRef ? "ptr" : "ptr"

        DllCall(this.value, UserContextMarshal, UserContext, MemoryMarshal, Memory)
    }

    /**
     * A PFN_COMPRESS_FREE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_COMPRESS_FREE {
        /**
         * Creates a PFN_COMPRESS_FREE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
