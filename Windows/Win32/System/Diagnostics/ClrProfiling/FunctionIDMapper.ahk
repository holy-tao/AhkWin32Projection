#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct FunctionIDMapper {
    value : IntPtr

    __value {
        set {
            if (value is FunctionIDMapper) {
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
     * @param {Pointer<BOOL>} pbHookFunction 
     * @returns {Pointer} 
     */
    Call(funcId, pbHookFunction) {
        pbHookFunctionMarshal := pbHookFunction is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, IntPtr, funcId, pbHookFunctionMarshal, pbHookFunction, IntPtr)
        return result
    }

    /**
     * A FunctionIDMapper that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FunctionIDMapper {
        /**
         * Creates a FunctionIDMapper pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, BOOL) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, BOOL.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
