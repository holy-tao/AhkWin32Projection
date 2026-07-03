#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import ".\DMA_COMPLETION_STATUS.ahk" { DMA_COMPLETION_STATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DMA_COMPLETION_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is DMA_COMPLETION_ROUTINE) {
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
     * @param {Pointer<Void>} CompletionContext 
     * @param {DMA_COMPLETION_STATUS} _Status 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DmaAdapter, DeviceObject, CompletionContext, _Status) {
        CompletionContextMarshal := CompletionContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, DEVICE_OBJECT.Ptr, DeviceObject, CompletionContextMarshal, CompletionContext, DMA_COMPLETION_STATUS, _Status)
    }

    /**
     * A DMA_COMPLETION_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DMA_COMPLETION_ROUTINE {
        /**
         * Creates a DMA_COMPLETION_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, DEVICE_OBJECT, "ptr", DMA_COMPLETION_STATUS) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, DEVICE_OBJECT.Ptr, "ptr", DMA_COMPLETION_STATUS, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
