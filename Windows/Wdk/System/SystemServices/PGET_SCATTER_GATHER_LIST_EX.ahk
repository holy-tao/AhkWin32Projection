#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\Foundation\MDL.ahk" { MDL }
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import ".\DRIVER_LIST_CONTROL.ahk" { DRIVER_LIST_CONTROL }
#Import ".\PDMA_COMPLETION_ROUTINE.ahk" { PDMA_COMPLETION_ROUTINE }
#Import ".\SCATTER_GATHER_LIST.ahk" { SCATTER_GATHER_LIST }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PGET_SCATTER_GATHER_LIST_EX {
    value : IntPtr

    __value {
        set {
            if (value is PGET_SCATTER_GATHER_LIST_EX) {
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
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<Void>} DmaTransferContext 
     * @param {Pointer<MDL>} _Mdl 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @param {Integer} Flags 
     * @param {Pointer<DRIVER_LIST_CONTROL>} ExecutionRoutine 
     * @param {Pointer<Void>} _Context 
     * @param {BOOLEAN} WriteToDevice 
     * @param {Pointer<PDMA_COMPLETION_ROUTINE>} DmaCompletionRoutine 
     * @param {Pointer<Void>} CompletionContext 
     * @param {Pointer<Pointer<SCATTER_GATHER_LIST>>} ScatterGatherList 
     * @returns {NTSTATUS} 
     */
    Call(DmaAdapter, DeviceObject, DmaTransferContext, _Mdl, Offset, Length, Flags, ExecutionRoutine, _Context, WriteToDevice, DmaCompletionRoutine, CompletionContext, ScatterGatherList) {
        DmaTransferContextMarshal := DmaTransferContext is VarRef ? "ptr" : "ptr"
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        CompletionContextMarshal := CompletionContext is VarRef ? "ptr" : "ptr"
        ScatterGatherListMarshal := ScatterGatherList is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, DEVICE_OBJECT.Ptr, DeviceObject, DmaTransferContextMarshal, DmaTransferContext, MDL.Ptr, _Mdl, Int64, Offset, UInt32, Length, UInt32, Flags, DRIVER_LIST_CONTROL, ExecutionRoutine, _ContextMarshal, _Context, BOOLEAN, WriteToDevice, PDMA_COMPLETION_ROUTINE, DmaCompletionRoutine, CompletionContextMarshal, CompletionContext, ScatterGatherListMarshal, ScatterGatherList, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PGET_SCATTER_GATHER_LIST_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_SCATTER_GATHER_LIST_EX {
        /**
         * Creates a PGET_SCATTER_GATHER_LIST_EX pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, DEVICE_OBJECT, "ptr", MDL, Int64, UInt32, UInt32, DRIVER_LIST_CONTROL, "ptr", BOOLEAN, PDMA_COMPLETION_ROUTINE, "ptr", "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 13)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 13 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, DEVICE_OBJECT.Ptr, "ptr", MDL.Ptr, Int64, UInt32, UInt32, DRIVER_LIST_CONTROL, "ptr", BOOLEAN, PDMA_COMPLETION_ROUTINE, "ptr", "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
