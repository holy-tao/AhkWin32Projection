#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PREAD_DMA_COUNTER {
    value : IntPtr

    __value {
        set {
            if (value is PREAD_DMA_COUNTER) {
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
     * @returns {Integer} 
     */
    Call(DmaAdapter) {
        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, UInt32)
        return result
    }

    /**
     * A PREAD_DMA_COUNTER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PREAD_DMA_COUNTER {
        /**
         * Creates a PREAD_DMA_COUNTER pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
