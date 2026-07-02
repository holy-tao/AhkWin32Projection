#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PTM_PROPAGATE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PTM_PROPAGATE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} PropagationCookie 
     * @param {Pointer<Void>} CallbackData 
     * @param {NTSTATUS} PropagationStatus 
     * @param {Guid} TransactionGuid 
     * @returns {NTSTATUS} 
     */
    Call(PropagationCookie, CallbackData, PropagationStatus, TransactionGuid) {
        PropagationCookieMarshal := PropagationCookie is VarRef ? "ptr" : "ptr"
        CallbackDataMarshal := CallbackData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, PropagationCookieMarshal, PropagationCookie, CallbackDataMarshal, CallbackData, NTSTATUS, PropagationStatus, Guid, TransactionGuid, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PTM_PROPAGATE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PTM_PROPAGATE_ROUTINE {
        /**
         * Creates a PTM_PROPAGATE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", NTSTATUS, Guid) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", NTSTATUS, Guid, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
