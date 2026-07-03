#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct LPTASKCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPTASKCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} dwInst 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(dwInst) {
        DllCall(this.value, IntPtr, dwInst)
    }

    /**
     * A LPTASKCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPTASKCALLBACK {
        /**
         * Creates a LPTASKCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
