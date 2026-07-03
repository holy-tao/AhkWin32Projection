#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PREPLACE_SET_PROCESSOR_ID {
    value : IntPtr

    __value {
        set {
            if (value is PREPLACE_SET_PROCESSOR_ID) {
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
     * @param {Integer} ApicId 
     * @param {BOOLEAN} Target 
     * @returns {NTSTATUS} 
     */
    Call(_Context, ApicId, Target) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, UInt32, ApicId, BOOLEAN, Target, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PREPLACE_SET_PROCESSOR_ID that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PREPLACE_SET_PROCESSOR_ID {
        /**
         * Creates a PREPLACE_SET_PROCESSOR_ID pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, BOOLEAN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, BOOLEAN, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
