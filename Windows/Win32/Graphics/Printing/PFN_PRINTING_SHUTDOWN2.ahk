#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_PRINTING_SHUTDOWN2 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PRINTING_SHUTDOWN2) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0) {
        DllCall(this.value, HANDLE, param0)
    }

    /**
     * A PFN_PRINTING_SHUTDOWN2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PRINTING_SHUTDOWN2 {
        /**
         * Creates a PFN_PRINTING_SHUTDOWN2 pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
