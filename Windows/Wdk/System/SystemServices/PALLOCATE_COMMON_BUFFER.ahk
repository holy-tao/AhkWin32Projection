#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PALLOCATE_COMMON_BUFFER {
    value : IntPtr

    __value {
        set {
            if (value is PALLOCATE_COMMON_BUFFER) {
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
     * @param {Integer} Length 
     * @param {Pointer<Integer>} LogicalAddress 
     * @param {BOOLEAN} CacheEnabled 
     * @returns {Pointer<Void>} 
     */
    Call(DmaAdapter, Length, LogicalAddress, CacheEnabled) {
        LogicalAddressMarshal := LogicalAddress is VarRef ? "int64*" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, UInt32, Length, LogicalAddressMarshal, LogicalAddress, BOOLEAN, CacheEnabled, IntPtr)
        return result
    }

    /**
     * A PALLOCATE_COMMON_BUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PALLOCATE_COMMON_BUFFER {
        /**
         * Creates a PALLOCATE_COMMON_BUFFER pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, UInt32, "int64*", BOOLEAN) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, UInt32, "int64*", BOOLEAN, "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
