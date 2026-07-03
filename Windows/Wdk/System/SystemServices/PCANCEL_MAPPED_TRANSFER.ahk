#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCANCEL_MAPPED_TRANSFER {
    value : IntPtr

    __value {
        set {
            if (value is PCANCEL_MAPPED_TRANSFER) {
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
     * @param {Pointer<Void>} DmaTransferContext 
     * @returns {NTSTATUS} 
     */
    Call(DmaAdapter, DmaTransferContext) {
        DmaTransferContextMarshal := DmaTransferContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, DmaTransferContextMarshal, DmaTransferContext, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PCANCEL_MAPPED_TRANSFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCANCEL_MAPPED_TRANSFER {
        /**
         * Creates a PCANCEL_MAPPED_TRANSFER pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
