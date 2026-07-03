#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PALLOCATE_ADAPTER_CHANNEL {
    value : IntPtr

    __value {
        set {
            if (value is PALLOCATE_ADAPTER_CHANNEL) {
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
     * @param {Integer} NumberOfMapRegisters 
     * @param {Pointer<DRIVER_CONTROL>} ExecutionRoutine 
     * @param {Pointer<Void>} _Context 
     * @returns {NTSTATUS} 
     */
    Call(DmaAdapter, DeviceObject, NumberOfMapRegisters, ExecutionRoutine, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, DEVICE_OBJECT.Ptr, DeviceObject, UInt32, NumberOfMapRegisters, "ptr", ExecutionRoutine, _ContextMarshal, _Context, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PALLOCATE_ADAPTER_CHANNEL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PALLOCATE_ADAPTER_CHANNEL {
        /**
         * Creates a PALLOCATE_ADAPTER_CHANNEL pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, DEVICE_OBJECT, UInt32, "ptr", "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, DEVICE_OBJECT.Ptr, UInt32, "ptr", "ptr", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
