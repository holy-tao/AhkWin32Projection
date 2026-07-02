#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\COR_PRF_FUNCTION_ARGUMENT_INFO.ahk" { COR_PRF_FUNCTION_ARGUMENT_INFO }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct FunctionEnter2 {
    value : IntPtr

    __value {
        set {
            if (value is FunctionEnter2) {
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
     * @param {Pointer<COR_PRF_FUNCTION_ARGUMENT_INFO>} argumentInfo 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(funcId, clientData, _func, argumentInfo) {
        DllCall(this.value, IntPtr, funcId, IntPtr, clientData, IntPtr, _func, COR_PRF_FUNCTION_ARGUMENT_INFO.Ptr, argumentInfo)
    }

    /**
     * A FunctionEnter2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FunctionEnter2 {
        /**
         * Creates a FunctionEnter2 pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, IntPtr, COR_PRF_FUNCTION_ARGUMENT_INFO) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, IntPtr, COR_PRF_FUNCTION_ARGUMENT_INFO.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
