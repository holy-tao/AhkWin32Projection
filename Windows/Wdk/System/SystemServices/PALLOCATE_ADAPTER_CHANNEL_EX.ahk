#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\Foundation\DRIVER_CONTROL.ahk" { DRIVER_CONTROL }
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PALLOCATE_ADAPTER_CHANNEL_EX {
    value : IntPtr

    __value {
        set {
            if (value is PALLOCATE_ADAPTER_CHANNEL_EX) {
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
     * @param {Integer} NumberOfMapRegisters 
     * @param {Integer} Flags 
     * @param {Pointer<DRIVER_CONTROL>} ExecutionRoutine 
     * @param {Pointer<Void>} ExecutionContext 
     * @param {Pointer<Pointer<Void>>} MapRegisterBase 
     * @returns {NTSTATUS} 
     */
    Call(DmaAdapter, DeviceObject, DmaTransferContext, NumberOfMapRegisters, Flags, ExecutionRoutine, ExecutionContext, MapRegisterBase) {
        DmaTransferContextMarshal := DmaTransferContext is VarRef ? "ptr" : "ptr"
        ExecutionContextMarshal := ExecutionContext is VarRef ? "ptr" : "ptr"
        MapRegisterBaseMarshal := MapRegisterBase is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, DEVICE_OBJECT.Ptr, DeviceObject, DmaTransferContextMarshal, DmaTransferContext, UInt32, NumberOfMapRegisters, UInt32, Flags, DRIVER_CONTROL, ExecutionRoutine, ExecutionContextMarshal, ExecutionContext, MapRegisterBaseMarshal, MapRegisterBase, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PALLOCATE_ADAPTER_CHANNEL_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PALLOCATE_ADAPTER_CHANNEL_EX {
        /**
         * Creates a PALLOCATE_ADAPTER_CHANNEL_EX pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, DEVICE_OBJECT, "ptr", UInt32, UInt32, DRIVER_CONTROL, "ptr", "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, DEVICE_OBJECT.Ptr, "ptr", UInt32, UInt32, DRIVER_CONTROL, "ptr", "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
