#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct FunctionTailcall {
    value : IntPtr

    __value {
        set {
            if (value is FunctionTailcall) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} funcID 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(funcID) {
        DllCall(this.value, IntPtr, funcID)
    }

    /**
     * A FunctionTailcall that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FunctionTailcall {
        /**
         * Creates a FunctionTailcall pointer that invokes the given AHK function when called.
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
