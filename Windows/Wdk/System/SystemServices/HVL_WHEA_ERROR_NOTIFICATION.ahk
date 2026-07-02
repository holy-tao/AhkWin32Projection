#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\WHEA_RECOVERY_CONTEXT.ahk" { WHEA_RECOVERY_CONTEXT }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct HVL_WHEA_ERROR_NOTIFICATION {
    value : IntPtr

    __value {
        set {
            if (value is HVL_WHEA_ERROR_NOTIFICATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WHEA_RECOVERY_CONTEXT>} RecoveryContext 
     * @param {BOOLEAN} PlatformDirected 
     * @param {BOOLEAN} Poisoned 
     * @returns {NTSTATUS} 
     */
    Call(RecoveryContext, PlatformDirected, Poisoned) {
        result := DllCall(this.value, WHEA_RECOVERY_CONTEXT.Ptr, RecoveryContext, BOOLEAN, PlatformDirected, BOOLEAN, Poisoned, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A HVL_WHEA_ERROR_NOTIFICATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends HVL_WHEA_ERROR_NOTIFICATION {
        /**
         * Creates a HVL_WHEA_ERROR_NOTIFICATION pointer that invokes the given AHK function when called.
         * @param {Func(WHEA_RECOVERY_CONTEXT, BOOLEAN, BOOLEAN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WHEA_RECOVERY_CONTEXT.Ptr, BOOLEAN, BOOLEAN, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
