#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_DESCRIPTOR.ahk" { WHEA_ERROR_SOURCE_DESCRIPTOR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct _WHEA_ERROR_SOURCE_INITIALIZE {
    value : IntPtr

    __value {
        set {
            if (value is _WHEA_ERROR_SOURCE_INITIALIZE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} Phase 
     * @param {Pointer<WHEA_ERROR_SOURCE_DESCRIPTOR>} ErrorSource 
     * @param {Pointer<Void>} _Context 
     * @returns {NTSTATUS} 
     */
    Call(Phase, ErrorSource, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, Phase, WHEA_ERROR_SOURCE_DESCRIPTOR.Ptr, ErrorSource, _ContextMarshal, _Context, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A _WHEA_ERROR_SOURCE_INITIALIZE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends _WHEA_ERROR_SOURCE_INITIALIZE {
        /**
         * Creates a _WHEA_ERROR_SOURCE_INITIALIZE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, WHEA_ERROR_SOURCE_DESCRIPTOR, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, WHEA_ERROR_SOURCE_DESCRIPTOR.Ptr, "ptr", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
