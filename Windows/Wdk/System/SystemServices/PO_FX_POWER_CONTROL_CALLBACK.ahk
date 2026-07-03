#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PO_FX_POWER_CONTROL_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PO_FX_POWER_CONTROL_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} DeviceContext 
     * @param {Pointer<Guid>} PowerControlCode 
     * @param {Integer} InBuffer 
     * @param {Pointer} InBufferSize 
     * @param {Integer} OutBuffer 
     * @param {Pointer} OutBufferSize 
     * @param {Pointer<Pointer>} BytesReturned 
     * @returns {NTSTATUS} 
     */
    Call(DeviceContext, PowerControlCode, InBuffer, InBufferSize, OutBuffer, OutBufferSize, BytesReturned) {
        DeviceContextMarshal := DeviceContext is VarRef ? "ptr" : "ptr"
        BytesReturnedMarshal := BytesReturned is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DeviceContextMarshal, DeviceContext, Guid.Ptr, PowerControlCode, IntPtr, InBuffer, IntPtr, InBufferSize, IntPtr, OutBuffer, IntPtr, OutBufferSize, BytesReturnedMarshal, BytesReturned, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PO_FX_POWER_CONTROL_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PO_FX_POWER_CONTROL_CALLBACK {
        /**
         * Creates a PO_FX_POWER_CONTROL_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Guid, IntPtr, IntPtr, IntPtr, IntPtr, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Guid.Ptr, IntPtr, IntPtr, IntPtr, IntPtr, "ptr*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
