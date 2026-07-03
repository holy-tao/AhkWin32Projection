#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_DESCRIPTOR.ahk" { WHEA_ERROR_SOURCE_DESCRIPTOR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PSHED_PI_RETRIEVE_ERROR_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PSHED_PI_RETRIEVE_ERROR_INFO) {
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
     * @param {Integer} Packet 
     * @returns {NTSTATUS} 
     */
    Call(PluginContext, ErrorSource, BufferLength, Packet) {
        PluginContextMarshal := PluginContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, PluginContextMarshal, PluginContext, WHEA_ERROR_SOURCE_DESCRIPTOR.Ptr, ErrorSource, Int64, BufferLength, IntPtr, Packet, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PSHED_PI_RETRIEVE_ERROR_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSHED_PI_RETRIEVE_ERROR_INFO {
        /**
         * Creates a PSHED_PI_RETRIEVE_ERROR_INFO pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WHEA_ERROR_SOURCE_DESCRIPTOR, Int64, IntPtr) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WHEA_ERROR_SOURCE_DESCRIPTOR.Ptr, Int64, IntPtr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
