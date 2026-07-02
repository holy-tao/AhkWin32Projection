#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\WHEA_ERROR_INJECTION_CAPABILITIES.ahk" { WHEA_ERROR_INJECTION_CAPABILITIES }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PSHED_PI_GET_INJECTION_CAPABILITIES {
    value : IntPtr

    __value {
        set {
            if (value is PSHED_PI_GET_INJECTION_CAPABILITIES) {
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
     * @param {Pointer<WHEA_ERROR_INJECTION_CAPABILITIES>} Capabilities 
     * @returns {NTSTATUS} 
     */
    Call(PluginContext, Capabilities) {
        PluginContextMarshal := PluginContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, PluginContextMarshal, PluginContext, WHEA_ERROR_INJECTION_CAPABILITIES.Ptr, Capabilities, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PSHED_PI_GET_INJECTION_CAPABILITIES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSHED_PI_GET_INJECTION_CAPABILITIES {
        /**
         * Creates a PSHED_PI_GET_INJECTION_CAPABILITIES pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WHEA_ERROR_INJECTION_CAPABILITIES) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WHEA_ERROR_INJECTION_CAPABILITIES.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
