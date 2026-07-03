#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCONFIGURE_ADAPTER_CHANNEL {
    value : IntPtr

    __value {
        set {
            if (value is PCONFIGURE_ADAPTER_CHANNEL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DMA_ADAPTER>} DmaAdapter 
     * @param {Integer} FunctionNumber 
     * @param {Pointer<Void>} _Context 
     * @returns {NTSTATUS} 
     */
    Call(DmaAdapter, FunctionNumber, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, UInt32, FunctionNumber, _ContextMarshal, _Context, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PCONFIGURE_ADAPTER_CHANNEL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCONFIGURE_ADAPTER_CHANNEL {
        /**
         * Creates a PCONFIGURE_ADAPTER_CHANNEL pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, UInt32, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, UInt32, "ptr", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
