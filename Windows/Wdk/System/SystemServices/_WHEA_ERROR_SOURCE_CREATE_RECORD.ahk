#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_ERROR_PACKET_V2.ahk" { WHEA_ERROR_PACKET_V2 }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_DESCRIPTOR.ahk" { WHEA_ERROR_SOURCE_DESCRIPTOR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct _WHEA_ERROR_SOURCE_CREATE_RECORD {
    value : IntPtr

    __value {
        set {
            if (value is _WHEA_ERROR_SOURCE_CREATE_RECORD) {
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
     * @param {Pointer<WHEA_ERROR_PACKET_V2>} ErrorPacket 
     * @param {Integer} ErrorRecord 
     * @param {Integer} BufferSize 
     * @param {Pointer<Void>} _Context 
     * @returns {NTSTATUS} 
     */
    Call(ErrorSource, ErrorPacket, ErrorRecord, BufferSize, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, WHEA_ERROR_SOURCE_DESCRIPTOR.Ptr, ErrorSource, WHEA_ERROR_PACKET_V2.Ptr, ErrorPacket, IntPtr, ErrorRecord, UInt32, BufferSize, _ContextMarshal, _Context, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A _WHEA_ERROR_SOURCE_CREATE_RECORD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends _WHEA_ERROR_SOURCE_CREATE_RECORD {
        /**
         * Creates a _WHEA_ERROR_SOURCE_CREATE_RECORD pointer that invokes the given AHK function when called.
         * @param {Func(WHEA_ERROR_SOURCE_DESCRIPTOR, WHEA_ERROR_PACKET_V2, IntPtr, UInt32, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WHEA_ERROR_SOURCE_DESCRIPTOR.Ptr, WHEA_ERROR_PACKET_V2.Ptr, IntPtr, UInt32, "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
