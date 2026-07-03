#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import ".\MEMORY_CACHING_TYPE.ahk" { MEMORY_CACHING_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PALLOCATE_COMMON_BUFFER_WITH_BOUNDS {
    value : IntPtr

    __value {
        set {
            if (value is PALLOCATE_COMMON_BUFFER_WITH_BOUNDS) {
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
     * @param {Pointer<Integer>} MinimumAddress 
     * @param {Pointer<Integer>} MaximumAddress 
     * @param {Integer} Length 
     * @param {Integer} Flags 
     * @param {Pointer<MEMORY_CACHING_TYPE>} CacheType 
     * @param {Integer} PreferredNode 
     * @param {Pointer<Integer>} LogicalAddress 
     * @returns {Pointer<Void>} 
     */
    Call(DmaAdapter, MinimumAddress, MaximumAddress, Length, Flags, CacheType, PreferredNode, LogicalAddress) {
        MinimumAddressMarshal := MinimumAddress is VarRef ? "int64*" : "ptr"
        MaximumAddressMarshal := MaximumAddress is VarRef ? "int64*" : "ptr"
        CacheTypeMarshal := CacheType is VarRef ? "int*" : "ptr"
        LogicalAddressMarshal := LogicalAddress is VarRef ? "int64*" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, MinimumAddressMarshal, MinimumAddress, MaximumAddressMarshal, MaximumAddress, UInt32, Length, UInt32, Flags, CacheTypeMarshal, CacheType, UInt32, PreferredNode, LogicalAddressMarshal, LogicalAddress, IntPtr)
        return result
    }

    /**
     * A PALLOCATE_COMMON_BUFFER_WITH_BOUNDS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PALLOCATE_COMMON_BUFFER_WITH_BOUNDS {
        /**
         * Creates a PALLOCATE_COMMON_BUFFER_WITH_BOUNDS pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, "int64*", "int64*", UInt32, UInt32, "int*", UInt32, "int64*") => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, "int64*", "int64*", UInt32, UInt32, "int*", UInt32, "int64*", "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
