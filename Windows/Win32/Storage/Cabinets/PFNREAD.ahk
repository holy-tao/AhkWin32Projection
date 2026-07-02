#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct PFNREAD {
    value : IntPtr

    __value {
        set {
            if (value is PFNREAD) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} hf 
     * @param {Integer} pv 
     * @param {Integer} cb 
     * @returns {Integer} 
     */
    Call(hf, pv, cb) {
        result := DllCall(this.value, IntPtr, hf, IntPtr, pv, UInt32, cb, UInt32)
        return result
    }

    /**
     * A PFNREAD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNREAD {
        /**
         * Creates a PFNREAD pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [IntPtr, IntPtr, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
