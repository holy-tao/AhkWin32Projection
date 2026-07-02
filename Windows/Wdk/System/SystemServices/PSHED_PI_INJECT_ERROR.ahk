#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PSHED_PI_INJECT_ERROR {
    value : IntPtr

    __value {
        set {
            if (value is PSHED_PI_INJECT_ERROR) {
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
     * @param {Integer} ErrorType 
     * @param {Integer} Parameter1 
     * @param {Integer} Parameter2 
     * @param {Integer} Parameter3 
     * @param {Integer} Parameter4 
     * @returns {NTSTATUS} 
     */
    Call(PluginContext, ErrorType, Parameter1, Parameter2, Parameter3, Parameter4) {
        PluginContextMarshal := PluginContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, PluginContextMarshal, PluginContext, Int64, ErrorType, Int64, Parameter1, Int64, Parameter2, Int64, Parameter3, Int64, Parameter4, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PSHED_PI_INJECT_ERROR that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSHED_PI_INJECT_ERROR {
        /**
         * Creates a PSHED_PI_INJECT_ERROR pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int64, Int64, Int64, Int64, Int64) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int64, Int64, Int64, Int64, Int64, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
