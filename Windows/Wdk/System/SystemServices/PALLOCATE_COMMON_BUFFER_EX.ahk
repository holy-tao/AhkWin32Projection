#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PALLOCATE_COMMON_BUFFER_EX {
    value : IntPtr

    __value {
        set {
            if (value is PALLOCATE_COMMON_BUFFER_EX) {
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
     * @param {Pointer<Integer>} MaximumAddress 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} LogicalAddress 
     * @param {BOOLEAN} CacheEnabled 
     * @param {Integer} PreferredNode 
     * @returns {Pointer<Void>} 
     */
    Call(DmaAdapter, MaximumAddress, Length, LogicalAddress, CacheEnabled, PreferredNode) {
        MaximumAddressMarshal := MaximumAddress is VarRef ? "int64*" : "ptr"
        LogicalAddressMarshal := LogicalAddress is VarRef ? "int64*" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, MaximumAddressMarshal, MaximumAddress, UInt32, Length, LogicalAddressMarshal, LogicalAddress, BOOLEAN, CacheEnabled, UInt32, PreferredNode, IntPtr)
        return result
    }

    /**
     * A PALLOCATE_COMMON_BUFFER_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PALLOCATE_COMMON_BUFFER_EX {
        /**
         * Creates a PALLOCATE_COMMON_BUFFER_EX pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, "int64*", UInt32, "int64*", BOOLEAN, UInt32) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, "int64*", UInt32, "int64*", BOOLEAN, UInt32, "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
