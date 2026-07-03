#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct FunctionIDMapper2 {
    value : IntPtr

    __value {
        set {
            if (value is FunctionIDMapper2) {
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
     * @param {Pointer<Void>} clientData 
     * @param {Pointer<BOOL>} pbHookFunction 
     * @returns {Pointer} 
     */
    Call(funcId, clientData, pbHookFunction) {
        clientDataMarshal := clientData is VarRef ? "ptr" : "ptr"
        pbHookFunctionMarshal := pbHookFunction is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, IntPtr, funcId, clientDataMarshal, clientData, pbHookFunctionMarshal, pbHookFunction, IntPtr)
        return result
    }

    /**
     * A FunctionIDMapper2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FunctionIDMapper2 {
        /**
         * Creates a FunctionIDMapper2 pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "ptr", BOOL) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr", BOOL.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
