#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PLEAVE_DMA_DOMAIN {
    value : IntPtr

    __value {
        set {
            if (value is PLEAVE_DMA_DOMAIN) {
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
     * @returns {NTSTATUS} 
     */
    Call(DmaAdapter) {
        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLEAVE_DMA_DOMAIN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLEAVE_DMA_DOMAIN {
        /**
         * Creates a PLEAVE_DMA_DOMAIN pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
