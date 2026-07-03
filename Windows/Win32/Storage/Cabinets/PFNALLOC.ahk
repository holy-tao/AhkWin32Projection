#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct PFNALLOC {
    value : IntPtr

    __value {
        set {
            if (value is PFNALLOC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} cb 
     * @returns {Pointer<Void>} 
     */
    Call(cb) {
        result := DllCall(this.value, UInt32, cb, IntPtr)
        return result
    }

    /**
     * A PFNALLOC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNALLOC {
        /**
         * Creates a PFNALLOC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [UInt32, "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
