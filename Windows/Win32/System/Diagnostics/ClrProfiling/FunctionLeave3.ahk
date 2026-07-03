#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FunctionIDOrClientID.ahk" { FunctionIDOrClientID }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct FunctionLeave3 {
    value : IntPtr

    __value {
        set {
            if (value is FunctionLeave3) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {FunctionIDOrClientID} _functionIDOrClientID 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_functionIDOrClientID) {
        DllCall(this.value, FunctionIDOrClientID, _functionIDOrClientID)
    }

    /**
     * A FunctionLeave3 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FunctionLeave3 {
        /**
         * Creates a FunctionLeave3 pointer that invokes the given AHK function when called.
         * @param {Func(FunctionIDOrClientID) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FunctionIDOrClientID, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
