#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct EX_CALLBACK_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is EX_CALLBACK_FUNCTION) {
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
     * @param {Pointer<Void>} Argument1 
     * @param {Pointer<Void>} Argument2 
     * @returns {NTSTATUS} 
     */
    Call(CallbackContext, Argument1, Argument2) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"
        Argument1Marshal := Argument1 is VarRef ? "ptr" : "ptr"
        Argument2Marshal := Argument2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CallbackContextMarshal, CallbackContext, Argument1Marshal, Argument1, Argument2Marshal, Argument2, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A EX_CALLBACK_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EX_CALLBACK_FUNCTION {
        /**
         * Creates a EX_CALLBACK_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
