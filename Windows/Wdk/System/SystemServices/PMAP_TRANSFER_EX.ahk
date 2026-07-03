#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\MDL.ahk" { MDL }
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PMAP_TRANSFER_EX {
    value : IntPtr

    __value {
        set {
            if (value is PMAP_TRANSFER_EX) {
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
     * @param {Pointer<MDL>} _Mdl 
     * @param {Pointer<Void>} MapRegisterBase 
     * @param {Integer} Offset 
     * @param {Integer} DeviceOffset 
     * @param {Pointer<Integer>} Length 
     * @param {BOOLEAN} WriteToDevice 
     * @param {Integer} ScatterGatherBuffer 
     * @param {Integer} ScatterGatherBufferLength 
     * @param {Pointer<PDMA_COMPLETION_ROUTINE>} DmaCompletionRoutine 
     * @param {Pointer<Void>} CompletionContext 
     * @returns {NTSTATUS} 
     */
    Call(DmaAdapter, _Mdl, MapRegisterBase, Offset, DeviceOffset, Length, WriteToDevice, ScatterGatherBuffer, ScatterGatherBufferLength, DmaCompletionRoutine, CompletionContext) {
        MapRegisterBaseMarshal := MapRegisterBase is VarRef ? "ptr" : "ptr"
        LengthMarshal := Length is VarRef ? "uint*" : "ptr"
        CompletionContextMarshal := CompletionContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, MDL.Ptr, _Mdl, MapRegisterBaseMarshal, MapRegisterBase, Int64, Offset, UInt32, DeviceOffset, LengthMarshal, Length, BOOLEAN, WriteToDevice, IntPtr, ScatterGatherBuffer, UInt32, ScatterGatherBufferLength, "ptr", DmaCompletionRoutine, CompletionContextMarshal, CompletionContext, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PMAP_TRANSFER_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMAP_TRANSFER_EX {
        /**
         * Creates a PMAP_TRANSFER_EX pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, MDL, "ptr", Int64, UInt32, "uint*", BOOLEAN, IntPtr, UInt32, "ptr", "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 11)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 11 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, MDL.Ptr, "ptr", Int64, UInt32, "uint*", BOOLEAN, IntPtr, UInt32, "ptr", "ptr", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
