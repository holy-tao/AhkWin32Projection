#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\Foundation\DMA_COMMON_BUFFER_VECTOR.ahk" { DMA_COMMON_BUFFER_VECTOR }
#Import ".\MEMORY_CACHING_TYPE.ahk" { MEMORY_CACHING_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PALLOCATE_COMMON_BUFFER_VECTOR {
    value : IntPtr

    __value {
        set {
            if (value is PALLOCATE_COMMON_BUFFER_VECTOR) {
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
     * @param {Integer} LowAddress 
     * @param {Integer} HighAddress 
     * @param {MEMORY_CACHING_TYPE} CacheType 
     * @param {Integer} IdealNode 
     * @param {Integer} Flags 
     * @param {Integer} NumberOfElements 
     * @param {Integer} SizeOfElements 
     * @param {Pointer<Pointer<DMA_COMMON_BUFFER_VECTOR>>} VectorOut 
     * @returns {NTSTATUS} 
     */
    Call(DmaAdapter, LowAddress, HighAddress, CacheType, IdealNode, Flags, NumberOfElements, SizeOfElements, VectorOut) {
        VectorOutMarshal := VectorOut is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, Int64, LowAddress, Int64, HighAddress, MEMORY_CACHING_TYPE, CacheType, UInt32, IdealNode, UInt32, Flags, UInt32, NumberOfElements, Int64, SizeOfElements, VectorOutMarshal, VectorOut, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PALLOCATE_COMMON_BUFFER_VECTOR that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PALLOCATE_COMMON_BUFFER_VECTOR {
        /**
         * Creates a PALLOCATE_COMMON_BUFFER_VECTOR pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, Int64, Int64, MEMORY_CACHING_TYPE, UInt32, UInt32, UInt32, Int64, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, Int64, Int64, MEMORY_CACHING_TYPE, UInt32, UInt32, UInt32, Int64, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
