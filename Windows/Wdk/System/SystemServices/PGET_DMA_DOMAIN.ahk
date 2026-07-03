#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PGET_DMA_DOMAIN {
    value : IntPtr

    __value {
        set {
            if (value is PGET_DMA_DOMAIN) {
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
     * @returns {HANDLE} 
     */
    Call(DmaAdapter) {
        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, HANDLE.Owned)
        return result
    }

    /**
     * A PGET_DMA_DOMAIN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_DMA_DOMAIN {
        /**
         * Creates a PGET_DMA_DOMAIN pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER) => HANDLE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, HANDLE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
