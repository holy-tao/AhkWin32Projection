#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import ".\DMA_ADAPTER_INFO.ahk" { DMA_ADAPTER_INFO }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PGET_DMA_ADAPTER_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PGET_DMA_ADAPTER_INFO) {
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
     * @param {Pointer<DMA_ADAPTER_INFO>} AdapterInfo 
     * @returns {NTSTATUS} 
     */
    Call(DmaAdapter, AdapterInfo) {
        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, DMA_ADAPTER_INFO.Ptr, AdapterInfo, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PGET_DMA_ADAPTER_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_DMA_ADAPTER_INFO {
        /**
         * Creates a PGET_DMA_ADAPTER_INFO pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, DMA_ADAPTER_INFO) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, DMA_ADAPTER_INFO.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
