#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct FunctionTailcall2 {
    value : IntPtr

    __value {
        set {
            if (value is FunctionTailcall2) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} funcId 
     * @param {Pointer} clientData 
     * @param {Pointer} _func 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(funcId, clientData, _func) {
        DllCall(this.value, IntPtr, funcId, IntPtr, clientData, IntPtr, _func)
    }

    /**
     * A FunctionTailcall2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FunctionTailcall2 {
        /**
         * Creates a FunctionTailcall2 pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, IntPtr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
