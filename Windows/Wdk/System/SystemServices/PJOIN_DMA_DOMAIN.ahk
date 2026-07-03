#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PJOIN_DMA_DOMAIN {
    value : IntPtr

    __value {
        set {
            if (value is PJOIN_DMA_DOMAIN) {
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
     * @param {HANDLE} DomainHandle 
     * @returns {NTSTATUS} 
     */
    Call(DmaAdapter, DomainHandle) {
        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, HANDLE, DomainHandle, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PJOIN_DMA_DOMAIN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PJOIN_DMA_DOMAIN {
        /**
         * Creates a PJOIN_DMA_DOMAIN pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, HANDLE) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, HANDLE, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
