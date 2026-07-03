#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct PFNSEEK {
    value : IntPtr

    __value {
        set {
            if (value is PFNSEEK) {
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
     * @param {Integer} dist 
     * @param {Integer} seektype 
     * @returns {Integer} 
     */
    Call(hf, dist, seektype) {
        result := DllCall(this.value, IntPtr, hf, Int32, dist, Int32, seektype, Int32)
        return result
    }

    /**
     * A PFNSEEK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNSEEK {
        /**
         * Creates a PFNSEEK pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, Int32, Int32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [IntPtr, Int32, Int32, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
