#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_BUS_SPECIFIC_RESET_TYPE.ahk" { DEVICE_BUS_SPECIFIC_RESET_TYPE }
#Import ".\BUS_SPECIFIC_RESET_FLAGS.ahk" { BUS_SPECIFIC_RESET_FLAGS }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEVICE_BUS_SPECIFIC_RESET_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is DEVICE_BUS_SPECIFIC_RESET_HANDLER) {
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
     * @param {Pointer<Guid>} BusType 
     * @param {DEVICE_BUS_SPECIFIC_RESET_TYPE} ResetTypeSelected 
     * @param {Pointer<BUS_SPECIFIC_RESET_FLAGS>} Flags 
     * @param {Pointer<Void>} ResetParameters 
     * @returns {NTSTATUS} 
     */
    Call(InterfaceContext, BusType, ResetTypeSelected, Flags, ResetParameters) {
        InterfaceContextMarshal := InterfaceContext is VarRef ? "ptr" : "ptr"
        ResetParametersMarshal := ResetParameters is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, InterfaceContextMarshal, InterfaceContext, Guid.Ptr, BusType, DEVICE_BUS_SPECIFIC_RESET_TYPE, ResetTypeSelected, BUS_SPECIFIC_RESET_FLAGS.Ptr, Flags, ResetParametersMarshal, ResetParameters, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A DEVICE_BUS_SPECIFIC_RESET_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DEVICE_BUS_SPECIFIC_RESET_HANDLER {
        /**
         * Creates a DEVICE_BUS_SPECIFIC_RESET_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Guid, DEVICE_BUS_SPECIFIC_RESET_TYPE, BUS_SPECIFIC_RESET_FLAGS, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Guid.Ptr, DEVICE_BUS_SPECIFIC_RESET_TYPE, BUS_SPECIFIC_RESET_FLAGS.Ptr, "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
