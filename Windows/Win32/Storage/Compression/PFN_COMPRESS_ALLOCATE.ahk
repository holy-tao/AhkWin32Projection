#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Compression
 */
export default struct PFN_COMPRESS_ALLOCATE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_COMPRESS_ALLOCATE) {
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
     * @param {Pointer} _Size 
     * @returns {Pointer<Void>} 
     */
    Call(UserContext, _Size) {
        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UserContextMarshal, UserContext, IntPtr, _Size, IntPtr)
        return result
    }

    /**
     * A PFN_COMPRESS_ALLOCATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_COMPRESS_ALLOCATE {
        /**
         * Creates a PFN_COMPRESS_ALLOCATE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", IntPtr, "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
