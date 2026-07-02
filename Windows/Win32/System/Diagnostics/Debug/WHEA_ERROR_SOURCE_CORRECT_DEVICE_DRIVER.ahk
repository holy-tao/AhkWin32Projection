#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WHEA_ERROR_SOURCE_CORRECT_DEVICE_DRIVER {
    value : IntPtr

    __value {
        set {
            if (value is WHEA_ERROR_SOURCE_CORRECT_DEVICE_DRIVER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} ErrorSourceDesc 
     * @param {Pointer<Integer>} MaximumSectionLength 
     * @returns {NTSTATUS} 
     */
    Call(ErrorSourceDesc, MaximumSectionLength) {
        ErrorSourceDescMarshal := ErrorSourceDesc is VarRef ? "ptr" : "ptr"
        MaximumSectionLengthMarshal := MaximumSectionLength is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, ErrorSourceDescMarshal, ErrorSourceDesc, MaximumSectionLengthMarshal, MaximumSectionLength, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A WHEA_ERROR_SOURCE_CORRECT_DEVICE_DRIVER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WHEA_ERROR_SOURCE_CORRECT_DEVICE_DRIVER {
        /**
         * Creates a WHEA_ERROR_SOURCE_CORRECT_DEVICE_DRIVER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "uint*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
