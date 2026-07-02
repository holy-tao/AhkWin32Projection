#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PREPLACE_GET_MEMORY_DESTINATION {
    value : IntPtr

    __value {
        set {
            if (value is PREPLACE_GET_MEMORY_DESTINATION) {
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
     * @param {Integer} SourceAddress 
     * @param {Pointer<Integer>} DestinationAddress 
     * @returns {NTSTATUS} 
     */
    Call(_Context, SourceAddress, DestinationAddress) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        DestinationAddressMarshal := DestinationAddress is VarRef ? "int64*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, Int64, SourceAddress, DestinationAddressMarshal, DestinationAddress, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PREPLACE_GET_MEMORY_DESTINATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PREPLACE_GET_MEMORY_DESTINATION {
        /**
         * Creates a PREPLACE_GET_MEMORY_DESTINATION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int64, "int64*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int64, "int64*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
