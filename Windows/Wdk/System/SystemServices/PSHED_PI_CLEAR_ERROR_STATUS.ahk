#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_DESCRIPTOR.ahk" { WHEA_ERROR_SOURCE_DESCRIPTOR }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PSHED_PI_CLEAR_ERROR_STATUS {
    value : IntPtr

    __value {
        set {
            if (value is PSHED_PI_CLEAR_ERROR_STATUS) {
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
     * @param {Pointer<WHEA_ERROR_SOURCE_DESCRIPTOR>} ErrorSource 
     * @param {Integer} BufferLength 
     * @param {Integer} ErrorRecord 
     * @returns {NTSTATUS} 
     */
    Call(PluginContext, ErrorSource, BufferLength, ErrorRecord) {
        PluginContextMarshal := PluginContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, PluginContextMarshal, PluginContext, WHEA_ERROR_SOURCE_DESCRIPTOR.Ptr, ErrorSource, UInt32, BufferLength, IntPtr, ErrorRecord, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PSHED_PI_CLEAR_ERROR_STATUS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSHED_PI_CLEAR_ERROR_STATUS {
        /**
         * Creates a PSHED_PI_CLEAR_ERROR_STATUS pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WHEA_ERROR_SOURCE_DESCRIPTOR, UInt32, IntPtr) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WHEA_ERROR_SOURCE_DESCRIPTOR.Ptr, UInt32, IntPtr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
