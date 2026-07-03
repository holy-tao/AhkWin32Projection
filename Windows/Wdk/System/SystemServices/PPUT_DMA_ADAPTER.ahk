#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PPUT_DMA_ADAPTER {
    value : IntPtr

    __value {
        set {
            if (value is PPUT_DMA_ADAPTER) {
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
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DmaAdapter) {
        DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter)
    }

    /**
     * A PPUT_DMA_ADAPTER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PPUT_DMA_ADAPTER {
        /**
         * Creates a PPUT_DMA_ADAPTER pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
