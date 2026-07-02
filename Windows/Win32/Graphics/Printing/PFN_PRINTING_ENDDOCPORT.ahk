#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_PRINTING_ENDDOCPORT {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PRINTING_ENDDOCPORT) {
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
     * @returns {BOOL} 
     */
    Call(param0) {
        result := DllCall(this.value, HANDLE, param0, BOOL)
        return result
    }

    /**
     * A PFN_PRINTING_ENDDOCPORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PRINTING_ENDDOCPORT {
        /**
         * Creates a PFN_PRINTING_ENDDOCPORT pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
