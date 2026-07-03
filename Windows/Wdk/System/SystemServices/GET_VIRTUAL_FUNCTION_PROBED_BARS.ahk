#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct GET_VIRTUAL_FUNCTION_PROBED_BARS {
    value : IntPtr

    __value {
        set {
            if (value is GET_VIRTUAL_FUNCTION_PROBED_BARS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<Integer>} BaseRegisterValues 
     * @returns {NTSTATUS} 
     */
    Call(_Context, BaseRegisterValues) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        BaseRegisterValuesMarshal := BaseRegisterValues is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, BaseRegisterValuesMarshal, BaseRegisterValues, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A GET_VIRTUAL_FUNCTION_PROBED_BARS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GET_VIRTUAL_FUNCTION_PROBED_BARS {
        /**
         * Creates a GET_VIRTUAL_FUNCTION_PROBED_BARS pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "uint*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
