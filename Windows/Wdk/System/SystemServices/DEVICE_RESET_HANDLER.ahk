#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_RESET_TYPE.ahk" { DEVICE_RESET_TYPE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEVICE_RESET_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is DEVICE_RESET_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} InterfaceContext 
     * @param {DEVICE_RESET_TYPE} ResetType 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} ResetParameters 
     * @returns {NTSTATUS} 
     */
    Call(InterfaceContext, ResetType, Flags, ResetParameters) {
        InterfaceContextMarshal := InterfaceContext is VarRef ? "ptr" : "ptr"
        ResetParametersMarshal := ResetParameters is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, InterfaceContextMarshal, InterfaceContext, DEVICE_RESET_TYPE, ResetType, UInt32, Flags, ResetParametersMarshal, ResetParameters, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A DEVICE_RESET_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DEVICE_RESET_HANDLER {
        /**
         * Creates a DEVICE_RESET_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DEVICE_RESET_TYPE, UInt32, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DEVICE_RESET_TYPE, UInt32, "ptr", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
