#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DMA_COMMON_BUFFER_VECTOR.ahk" { DMA_COMMON_BUFFER_VECTOR }
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PFREE_COMMON_BUFFER_FROM_VECTOR {
    value : IntPtr

    __value {
        set {
            if (value is PFREE_COMMON_BUFFER_FROM_VECTOR) {
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
     * @param {Pointer<DMA_COMMON_BUFFER_VECTOR>} Vector 
     * @param {Integer} Index 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DmaAdapter, Vector, Index) {
        VectorMarshal := Vector is VarRef ? "ptr*" : "ptr"

        DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, VectorMarshal, Vector, UInt32, Index)
    }

    /**
     * A PFREE_COMMON_BUFFER_FROM_VECTOR that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFREE_COMMON_BUFFER_FROM_VECTOR {
        /**
         * Creates a PFREE_COMMON_BUFFER_FROM_VECTOR pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, DMA_COMMON_BUFFER_VECTOR, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, DMA_COMMON_BUFFER_VECTOR.Ptr, UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
