#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\Foundation\DMA_COMMON_BUFFER_VECTOR.ahk" { DMA_COMMON_BUFFER_VECTOR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PGET_COMMON_BUFFER_FROM_VECTOR_BY_INDEX {
    value : IntPtr

    __value {
        set {
            if (value is PGET_COMMON_BUFFER_FROM_VECTOR_BY_INDEX) {
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
     * @param {Pointer<Pointer<Void>>} VirtualAddressOut 
     * @param {Pointer<Integer>} LogicalAddressOut 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DmaAdapter, Vector, Index, VirtualAddressOut, LogicalAddressOut) {
        VectorMarshal := Vector is VarRef ? "ptr*" : "ptr"
        VirtualAddressOutMarshal := VirtualAddressOut is VarRef ? "ptr*" : "ptr"
        LogicalAddressOutMarshal := LogicalAddressOut is VarRef ? "int64*" : "ptr"

        DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, VectorMarshal, Vector, UInt32, Index, VirtualAddressOutMarshal, VirtualAddressOut, LogicalAddressOutMarshal, LogicalAddressOut)
    }

    /**
     * A PGET_COMMON_BUFFER_FROM_VECTOR_BY_INDEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_COMMON_BUFFER_FROM_VECTOR_BY_INDEX {
        /**
         * Creates a PGET_COMMON_BUFFER_FROM_VECTOR_BY_INDEX pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, DMA_COMMON_BUFFER_VECTOR, UInt32, "ptr*", "int64*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, DMA_COMMON_BUFFER_VECTOR.Ptr, UInt32, "ptr*", "int64*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
