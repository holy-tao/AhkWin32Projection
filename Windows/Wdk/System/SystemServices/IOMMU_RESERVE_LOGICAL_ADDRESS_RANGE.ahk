#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\IOMMU_DMA_DOMAIN.ahk" { IOMMU_DMA_DOMAIN }
#Import ".\IOMMU_DMA_LOGICAL_ADDRESS_TOKEN.ahk" { IOMMU_DMA_LOGICAL_ADDRESS_TOKEN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_RESERVE_LOGICAL_ADDRESS_RANGE {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_RESERVE_LOGICAL_ADDRESS_RANGE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<IOMMU_DMA_DOMAIN>} Domain 
     * @param {Pointer} _Size 
     * @param {Pointer<Integer>} ExplicitLogicalAddress 
     * @param {Pointer<Integer>} MinLogicalAddress 
     * @param {Pointer<Integer>} MaxLogicalAddress 
     * @param {Pointer<Pointer<IOMMU_DMA_LOGICAL_ADDRESS_TOKEN>>} LogicalAddressToken 
     * @returns {NTSTATUS} 
     */
    Call(Domain, _Size, ExplicitLogicalAddress, MinLogicalAddress, MaxLogicalAddress, LogicalAddressToken) {
        DomainMarshal := Domain is VarRef ? "ptr*" : "ptr"
        ExplicitLogicalAddressMarshal := ExplicitLogicalAddress is VarRef ? "uint*" : "ptr"
        MinLogicalAddressMarshal := MinLogicalAddress is VarRef ? "uint*" : "ptr"
        MaxLogicalAddressMarshal := MaxLogicalAddress is VarRef ? "uint*" : "ptr"
        LogicalAddressTokenMarshal := LogicalAddressToken is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DomainMarshal, Domain, IntPtr, _Size, ExplicitLogicalAddressMarshal, ExplicitLogicalAddress, MinLogicalAddressMarshal, MinLogicalAddress, MaxLogicalAddressMarshal, MaxLogicalAddress, LogicalAddressTokenMarshal, LogicalAddressToken, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A IOMMU_RESERVE_LOGICAL_ADDRESS_RANGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_RESERVE_LOGICAL_ADDRESS_RANGE {
        /**
         * Creates a IOMMU_RESERVE_LOGICAL_ADDRESS_RANGE pointer that invokes the given AHK function when called.
         * @param {Func(IOMMU_DMA_DOMAIN, IntPtr, "uint*", "uint*", "uint*", "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IOMMU_DMA_DOMAIN.Ptr, IntPtr, "uint*", "uint*", "uint*", "ptr*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
