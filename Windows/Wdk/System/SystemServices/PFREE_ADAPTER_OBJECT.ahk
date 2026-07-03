#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import ".\IO_ALLOCATION_ACTION.ahk" { IO_ALLOCATION_ACTION }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PFREE_ADAPTER_OBJECT {
    value : IntPtr

    __value {
        set {
            if (value is PFREE_ADAPTER_OBJECT) {
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
     * @param {IO_ALLOCATION_ACTION} AllocationAction 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DmaAdapter, AllocationAction) {
        DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, IO_ALLOCATION_ACTION, AllocationAction)
    }

    /**
     * A PFREE_ADAPTER_OBJECT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFREE_ADAPTER_OBJECT {
        /**
         * Creates a PFREE_ADAPTER_OBJECT pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, IO_ALLOCATION_ACTION) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, IO_ALLOCATION_ACTION, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
