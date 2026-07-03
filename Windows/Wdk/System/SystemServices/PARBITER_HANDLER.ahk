#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ARBITER_ACTION.ahk" { ARBITER_ACTION }
#Import ".\ARBITER_PARAMETERS.ahk" { ARBITER_PARAMETERS }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PARBITER_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is PARBITER_HANDLER) {
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
     * @param {ARBITER_ACTION} Action 
     * @param {Pointer<ARBITER_PARAMETERS>} Parameters 
     * @returns {NTSTATUS} 
     */
    Call(_Context, Action, Parameters) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, ARBITER_ACTION, Action, ARBITER_PARAMETERS.Ptr, Parameters, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PARBITER_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PARBITER_HANDLER {
        /**
         * Creates a PARBITER_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", ARBITER_ACTION, ARBITER_PARAMETERS) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", ARBITER_ACTION, ARBITER_PARAMETERS.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
