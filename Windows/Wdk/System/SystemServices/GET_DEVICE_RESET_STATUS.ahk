#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_BUS_SPECIFIC_RESET_TYPE.ahk" { DEVICE_BUS_SPECIFIC_RESET_TYPE }
#Import ".\DEVICE_RESET_STATUS_FLAGS.ahk" { DEVICE_RESET_STATUS_FLAGS }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct GET_DEVICE_RESET_STATUS {
    value : IntPtr

    __value {
        set {
            if (value is GET_DEVICE_RESET_STATUS) {
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
     * @param {Pointer<BOOLEAN>} IsResetting 
     * @param {Pointer<DEVICE_BUS_SPECIFIC_RESET_TYPE>} ResetTypeSelected 
     * @param {Pointer<DEVICE_RESET_STATUS_FLAGS>} Flags 
     * @returns {NTSTATUS} 
     */
    Call(InterfaceContext, IsResetting, ResetTypeSelected, Flags) {
        InterfaceContextMarshal := InterfaceContext is VarRef ? "ptr" : "ptr"
        IsResettingMarshal := IsResetting is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, InterfaceContextMarshal, InterfaceContext, IsResettingMarshal, IsResetting, DEVICE_BUS_SPECIFIC_RESET_TYPE.Ptr, ResetTypeSelected, DEVICE_RESET_STATUS_FLAGS.Ptr, Flags, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A GET_DEVICE_RESET_STATUS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GET_DEVICE_RESET_STATUS {
        /**
         * Creates a GET_DEVICE_RESET_STATUS pointer that invokes the given AHK function when called.
         * @param {Func("ptr", BOOLEAN, DEVICE_BUS_SPECIFIC_RESET_TYPE, DEVICE_RESET_STATUS_FLAGS) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BOOLEAN.Ptr, DEVICE_BUS_SPECIFIC_RESET_TYPE.Ptr, DEVICE_RESET_STATUS_FLAGS.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
