#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PPATCH_PROGRESS_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PPATCH_PROGRESS_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} CallbackContext 
     * @param {Integer} CurrentPosition 
     * @param {Integer} MaximumPosition 
     * @returns {BOOL} 
     */
    Call(CallbackContext, CurrentPosition, MaximumPosition) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CallbackContextMarshal, CallbackContext, UInt32, CurrentPosition, UInt32, MaximumPosition, BOOL)
        return result
    }

    /**
     * A PPATCH_PROGRESS_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PPATCH_PROGRESS_CALLBACK {
        /**
         * Creates a PPATCH_PROGRESS_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
