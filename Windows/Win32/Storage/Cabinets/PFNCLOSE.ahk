#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct PFNCLOSE {
    value : IntPtr

    __value {
        set {
            if (value is PFNCLOSE) {
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
     * @returns {Integer} 
     */
    Call(hf) {
        result := DllCall(this.value, IntPtr, hf, Int32)
        return result
    }

    /**
     * A PFNCLOSE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNCLOSE {
        /**
         * Creates a PFNCLOSE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [IntPtr, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
