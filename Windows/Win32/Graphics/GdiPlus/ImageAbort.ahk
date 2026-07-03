#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct ImageAbort {
    value : IntPtr

    __value {
        set {
            if (value is ImageAbort) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @returns {BOOL} 
     */
    Call(param0) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, BOOL)
        return result
    }

    /**
     * A ImageAbort that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ImageAbort {
        /**
         * Creates a ImageAbort pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
