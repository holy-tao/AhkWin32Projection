#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCANCEL_ADAPTER_CHANNEL {
    value : IntPtr

    __value {
        set {
            if (value is PCANCEL_ADAPTER_CHANNEL) {
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
     * @returns {BOOLEAN} 
     */
    Call(DmaAdapter, DeviceObject, DmaTransferContext) {
        DmaTransferContextMarshal := DmaTransferContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, DEVICE_OBJECT.Ptr, DeviceObject, DmaTransferContextMarshal, DmaTransferContext, BOOLEAN)
        return result
    }

    /**
     * A PCANCEL_ADAPTER_CHANNEL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCANCEL_ADAPTER_CHANNEL {
        /**
         * Creates a PCANCEL_ADAPTER_CHANNEL pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, DEVICE_OBJECT, "ptr") => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, DEVICE_OBJECT.Ptr, "ptr", BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
