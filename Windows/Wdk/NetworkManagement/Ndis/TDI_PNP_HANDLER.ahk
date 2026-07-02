#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct TDI_PNP_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is TDI_PNP_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} UpperComponent 
     * @param {Pointer<UNICODE_STRING>} LowerComponent 
     * @param {Pointer<UNICODE_STRING>} BindList 
     * @param {Pointer<Void>} ReconfigBuffer 
     * @param {Integer} ReconfigBufferSize 
     * @param {Integer} Operation 
     * @returns {NTSTATUS} 
     */
    Call(UpperComponent, LowerComponent, BindList, ReconfigBuffer, ReconfigBufferSize, Operation) {
        ReconfigBufferMarshal := ReconfigBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UNICODE_STRING.Ptr, UpperComponent, UNICODE_STRING.Ptr, LowerComponent, UNICODE_STRING.Ptr, BindList, ReconfigBufferMarshal, ReconfigBuffer, UInt32, ReconfigBufferSize, UInt32, Operation, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A TDI_PNP_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends TDI_PNP_HANDLER {
        /**
         * Creates a TDI_PNP_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func(UNICODE_STRING, UNICODE_STRING, UNICODE_STRING, "ptr", UInt32, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UNICODE_STRING.Ptr, UNICODE_STRING.Ptr, UNICODE_STRING.Ptr, "ptr", UInt32, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
