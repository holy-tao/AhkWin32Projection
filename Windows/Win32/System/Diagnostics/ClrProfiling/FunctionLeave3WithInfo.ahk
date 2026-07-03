#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FunctionIDOrClientID.ahk" { FunctionIDOrClientID }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct FunctionLeave3WithInfo {
    value : IntPtr

    __value {
        set {
            if (value is FunctionLeave3WithInfo) {
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
     * @param {Pointer} eltInfo 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_functionIDOrClientID, eltInfo) {
        DllCall(this.value, FunctionIDOrClientID, _functionIDOrClientID, IntPtr, eltInfo)
    }

    /**
     * A FunctionLeave3WithInfo that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FunctionLeave3WithInfo {
        /**
         * Creates a FunctionLeave3WithInfo pointer that invokes the given AHK function when called.
         * @param {Func(FunctionIDOrClientID, IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FunctionIDOrClientID, IntPtr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
