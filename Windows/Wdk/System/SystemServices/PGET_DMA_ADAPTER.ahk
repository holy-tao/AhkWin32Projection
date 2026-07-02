#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PGET_DMA_ADAPTER {
    value : IntPtr

    __value {
        set {
            if (value is PGET_DMA_ADAPTER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {Pointer<DMA_ADAPTER>} 
     */
    Call() {
        result := DllCall(this.value, DMA_ADAPTER.Ptr)
        return result
    }

    /**
     * A PGET_DMA_ADAPTER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_DMA_ADAPTER {
        /**
         * Creates a PGET_DMA_ADAPTER pointer that invokes the given AHK function when called.
         * @param {Func() => DMA_ADAPTER.Ptr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
