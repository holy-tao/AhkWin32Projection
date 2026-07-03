#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PFREE_COMMON_BUFFER {
    value : IntPtr

    __value {
        set {
            if (value is PFREE_COMMON_BUFFER) {
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
     * @param {Integer} LogicalAddress 
     * @param {Pointer<Void>} VirtualAddress 
     * @param {BOOLEAN} CacheEnabled 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DmaAdapter, Length, LogicalAddress, VirtualAddress, CacheEnabled) {
        VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr" : "ptr"

        DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, UInt32, Length, Int64, LogicalAddress, VirtualAddressMarshal, VirtualAddress, BOOLEAN, CacheEnabled)
    }

    /**
     * A PFREE_COMMON_BUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFREE_COMMON_BUFFER {
        /**
         * Creates a PFREE_COMMON_BUFFER pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, UInt32, Int64, "ptr", BOOLEAN) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, UInt32, Int64, "ptr", BOOLEAN, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
