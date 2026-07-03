#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\Foundation\MDL.ahk" { MDL }
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PBUILD_SCATTER_GATHER_LIST {
    value : IntPtr

    __value {
        set {
            if (value is PBUILD_SCATTER_GATHER_LIST) {
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
     * @param {Pointer<MDL>} _Mdl 
     * @param {Pointer<Void>} CurrentVa 
     * @param {Integer} Length 
     * @param {Pointer<DRIVER_LIST_CONTROL>} ExecutionRoutine 
     * @param {Pointer<Void>} _Context 
     * @param {BOOLEAN} WriteToDevice 
     * @param {Pointer<Void>} ScatterGatherBuffer 
     * @param {Integer} ScatterGatherLength 
     * @returns {NTSTATUS} 
     */
    Call(DmaAdapter, DeviceObject, _Mdl, CurrentVa, Length, ExecutionRoutine, _Context, WriteToDevice, ScatterGatherBuffer, ScatterGatherLength) {
        CurrentVaMarshal := CurrentVa is VarRef ? "ptr" : "ptr"
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        ScatterGatherBufferMarshal := ScatterGatherBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, DEVICE_OBJECT.Ptr, DeviceObject, MDL.Ptr, _Mdl, CurrentVaMarshal, CurrentVa, UInt32, Length, "ptr", ExecutionRoutine, _ContextMarshal, _Context, BOOLEAN, WriteToDevice, ScatterGatherBufferMarshal, ScatterGatherBuffer, UInt32, ScatterGatherLength, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PBUILD_SCATTER_GATHER_LIST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PBUILD_SCATTER_GATHER_LIST {
        /**
         * Creates a PBUILD_SCATTER_GATHER_LIST pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, DEVICE_OBJECT, MDL, "ptr", UInt32, "ptr", "ptr", BOOLEAN, "ptr", UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 10)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 10 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, DEVICE_OBJECT.Ptr, MDL.Ptr, "ptr", UInt32, "ptr", "ptr", BOOLEAN, "ptr", UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
