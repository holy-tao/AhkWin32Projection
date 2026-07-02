#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERFACE_TYPE.ahk" { INTERFACE_TYPE }
#Import ".\CONFIGURATION_TYPE.ahk" { CONFIGURATION_TYPE }
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import ".\KEY_VALUE_FULL_INFORMATION.ahk" { KEY_VALUE_FULL_INFORMATION }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PIO_QUERY_DEVICE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PIO_QUERY_DEVICE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<UNICODE_STRING>} _PathName 
     * @param {INTERFACE_TYPE} BusType 
     * @param {Integer} BusNumber 
     * @param {Pointer<Pointer<KEY_VALUE_FULL_INFORMATION>>} BusInformation 
     * @param {CONFIGURATION_TYPE} ControllerType 
     * @param {Integer} ControllerNumber 
     * @param {Pointer<Pointer<KEY_VALUE_FULL_INFORMATION>>} ControllerInformation 
     * @param {CONFIGURATION_TYPE} PeripheralType 
     * @param {Integer} PeripheralNumber 
     * @param {Pointer<Pointer<KEY_VALUE_FULL_INFORMATION>>} PeripheralInformation 
     * @returns {NTSTATUS} 
     */
    Call(_Context, _PathName, BusType, BusNumber, BusInformation, ControllerType, ControllerNumber, ControllerInformation, PeripheralType, PeripheralNumber, PeripheralInformation) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        BusInformationMarshal := BusInformation is VarRef ? "ptr*" : "ptr"
        ControllerInformationMarshal := ControllerInformation is VarRef ? "ptr*" : "ptr"
        PeripheralInformationMarshal := PeripheralInformation is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, UNICODE_STRING.Ptr, _PathName, INTERFACE_TYPE, BusType, UInt32, BusNumber, BusInformationMarshal, BusInformation, CONFIGURATION_TYPE, ControllerType, UInt32, ControllerNumber, ControllerInformationMarshal, ControllerInformation, CONFIGURATION_TYPE, PeripheralType, UInt32, PeripheralNumber, PeripheralInformationMarshal, PeripheralInformation, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PIO_QUERY_DEVICE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIO_QUERY_DEVICE_ROUTINE {
        /**
         * Creates a PIO_QUERY_DEVICE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UNICODE_STRING, INTERFACE_TYPE, UInt32, "ptr*", CONFIGURATION_TYPE, UInt32, "ptr*", CONFIGURATION_TYPE, UInt32, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 11)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 11 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UNICODE_STRING.Ptr, INTERFACE_TYPE, UInt32, "ptr*", CONFIGURATION_TYPE, UInt32, "ptr*", CONFIGURATION_TYPE, UInt32, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
