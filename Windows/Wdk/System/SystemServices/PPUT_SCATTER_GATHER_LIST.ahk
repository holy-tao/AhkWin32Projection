#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SCATTER_GATHER_LIST.ahk" { SCATTER_GATHER_LIST }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PPUT_SCATTER_GATHER_LIST {
    value : IntPtr

    __value {
        set {
            if (value is PPUT_SCATTER_GATHER_LIST) {
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
     * @param {Pointer<SCATTER_GATHER_LIST>} ScatterGather 
     * @param {BOOLEAN} WriteToDevice 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DmaAdapter, ScatterGather, WriteToDevice) {
        DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, SCATTER_GATHER_LIST.Ptr, ScatterGather, BOOLEAN, WriteToDevice)
    }

    /**
     * A PPUT_SCATTER_GATHER_LIST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PPUT_SCATTER_GATHER_LIST {
        /**
         * Creates a PPUT_SCATTER_GATHER_LIST pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, SCATTER_GATHER_LIST, BOOLEAN) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, SCATTER_GATHER_LIST.Ptr, BOOLEAN, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
