#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\WHEA_ERROR_SEVERITY.ahk" { WHEA_ERROR_SEVERITY }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct _WHEA_ERROR_SOURCE_RECOVER {
    value : IntPtr

    __value {
        set {
            if (value is _WHEA_ERROR_SOURCE_RECOVER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} RecoveryContext 
     * @param {Pointer<WHEA_ERROR_SEVERITY>} Severity 
     * @returns {NTSTATUS} 
     */
    Call(RecoveryContext, Severity) {
        RecoveryContextMarshal := RecoveryContext is VarRef ? "ptr" : "ptr"
        SeverityMarshal := Severity is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, RecoveryContextMarshal, RecoveryContext, SeverityMarshal, Severity, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A _WHEA_ERROR_SOURCE_RECOVER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends _WHEA_ERROR_SOURCE_RECOVER {
        /**
         * Creates a _WHEA_ERROR_SOURCE_RECOVER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "int*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "int*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
