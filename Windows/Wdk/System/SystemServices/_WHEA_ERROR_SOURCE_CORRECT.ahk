#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_DESCRIPTOR.ahk" { WHEA_ERROR_SOURCE_DESCRIPTOR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct _WHEA_ERROR_SOURCE_CORRECT {
    value : IntPtr

    __value {
        set {
            if (value is _WHEA_ERROR_SOURCE_CORRECT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WHEA_ERROR_SOURCE_DESCRIPTOR>} ErrorSource 
     * @param {Pointer<Integer>} MaximumSectionLength 
     * @returns {NTSTATUS} 
     */
    Call(ErrorSource, MaximumSectionLength) {
        MaximumSectionLengthMarshal := MaximumSectionLength is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, WHEA_ERROR_SOURCE_DESCRIPTOR.Ptr, ErrorSource, MaximumSectionLengthMarshal, MaximumSectionLength, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A _WHEA_ERROR_SOURCE_CORRECT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends _WHEA_ERROR_SOURCE_CORRECT {
        /**
         * Creates a _WHEA_ERROR_SOURCE_CORRECT pointer that invokes the given AHK function when called.
         * @param {Func(WHEA_ERROR_SOURCE_DESCRIPTOR, "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WHEA_ERROR_SOURCE_DESCRIPTOR.Ptr, "uint*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
