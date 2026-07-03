#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PSHED_PI_GET_ALL_ERROR_SOURCES {
    value : IntPtr

    __value {
        set {
            if (value is PSHED_PI_GET_ALL_ERROR_SOURCES) {
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
     * @param {Pointer<Integer>} Count 
     * @param {Integer} ErrorSrcs 
     * @param {Pointer<Integer>} Length 
     * @returns {NTSTATUS} 
     */
    Call(PluginContext, Count, ErrorSrcs, Length) {
        PluginContextMarshal := PluginContext is VarRef ? "ptr" : "ptr"
        CountMarshal := Count is VarRef ? "uint*" : "ptr"
        LengthMarshal := Length is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, PluginContextMarshal, PluginContext, CountMarshal, Count, IntPtr, ErrorSrcs, LengthMarshal, Length, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PSHED_PI_GET_ALL_ERROR_SOURCES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSHED_PI_GET_ALL_ERROR_SOURCES {
        /**
         * Creates a PSHED_PI_GET_ALL_ERROR_SOURCES pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "uint*", IntPtr, "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "uint*", IntPtr, "uint*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
