#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PSHED_PI_ATTEMPT_ERROR_RECOVERY {
    value : IntPtr

    __value {
        set {
            if (value is PSHED_PI_ATTEMPT_ERROR_RECOVERY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} PluginContext 
     * @param {Integer} BufferLength 
     * @param {Integer} ErrorRecord 
     * @returns {NTSTATUS} 
     */
    Call(PluginContext, BufferLength, ErrorRecord) {
        PluginContextMarshal := PluginContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, PluginContextMarshal, PluginContext, UInt32, BufferLength, IntPtr, ErrorRecord, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PSHED_PI_ATTEMPT_ERROR_RECOVERY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSHED_PI_ATTEMPT_ERROR_RECOVERY {
        /**
         * Creates a PSHED_PI_ATTEMPT_ERROR_RECOVERY pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, IntPtr) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, IntPtr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
