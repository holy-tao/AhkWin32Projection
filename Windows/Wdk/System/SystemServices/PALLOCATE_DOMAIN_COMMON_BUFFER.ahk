#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import ".\MEMORY_CACHING_TYPE.ahk" { MEMORY_CACHING_TYPE }
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PALLOCATE_DOMAIN_COMMON_BUFFER {
    value : IntPtr

    __value {
        set {
            if (value is PALLOCATE_DOMAIN_COMMON_BUFFER) {
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
     * @param {Pointer<Integer>} MaximumAddress 
     * @param {Integer} Length 
     * @param {Integer} Flags 
     * @param {Pointer<MEMORY_CACHING_TYPE>} CacheType 
     * @param {Integer} PreferredNode 
     * @param {Pointer<Integer>} LogicalAddress 
     * @param {Pointer<Pointer<Void>>} VirtualAddress 
     * @returns {NTSTATUS} 
     */
    Call(DmaAdapter, DomainHandle, MaximumAddress, Length, Flags, CacheType, PreferredNode, LogicalAddress, VirtualAddress) {
        MaximumAddressMarshal := MaximumAddress is VarRef ? "int64*" : "ptr"
        CacheTypeMarshal := CacheType is VarRef ? "int*" : "ptr"
        LogicalAddressMarshal := LogicalAddress is VarRef ? "int64*" : "ptr"
        VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, HANDLE, DomainHandle, MaximumAddressMarshal, MaximumAddress, UInt32, Length, UInt32, Flags, CacheTypeMarshal, CacheType, UInt32, PreferredNode, LogicalAddressMarshal, LogicalAddress, VirtualAddressMarshal, VirtualAddress, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PALLOCATE_DOMAIN_COMMON_BUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PALLOCATE_DOMAIN_COMMON_BUFFER {
        /**
         * Creates a PALLOCATE_DOMAIN_COMMON_BUFFER pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, HANDLE, "int64*", UInt32, UInt32, "int*", UInt32, "int64*", "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, HANDLE, "int64*", UInt32, UInt32, "int*", UInt32, "int64*", "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
