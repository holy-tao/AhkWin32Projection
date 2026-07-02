#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IOMMU_MAP_PHYSICAL_ADDRESS.ahk" { IOMMU_MAP_PHYSICAL_ADDRESS }
#Import "..\..\Foundation\IOMMU_DMA_DOMAIN.ahk" { IOMMU_DMA_DOMAIN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_MAP_LOGICAL_RANGE_EX {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_MAP_LOGICAL_RANGE_EX) {
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
     * @param {Integer} Permissions 
     * @param {Pointer<IOMMU_MAP_PHYSICAL_ADDRESS>} PhysicalAddressToMap 
     * @param {Pointer<Integer>} ExplicitLogicalAddress 
     * @param {Pointer<Integer>} MinLogicalAddress 
     * @param {Pointer<Integer>} MaxLogicalAddress 
     * @param {Pointer<Integer>} LogicalAddressOut 
     * @returns {NTSTATUS} 
     */
    Call(Domain, Permissions, PhysicalAddressToMap, ExplicitLogicalAddress, MinLogicalAddress, MaxLogicalAddress, LogicalAddressOut) {
        DomainMarshal := Domain is VarRef ? "ptr*" : "ptr"
        ExplicitLogicalAddressMarshal := ExplicitLogicalAddress is VarRef ? "uint*" : "ptr"
        MinLogicalAddressMarshal := MinLogicalAddress is VarRef ? "uint*" : "ptr"
        MaxLogicalAddressMarshal := MaxLogicalAddress is VarRef ? "uint*" : "ptr"
        LogicalAddressOutMarshal := LogicalAddressOut is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, DomainMarshal, Domain, UInt32, Permissions, IOMMU_MAP_PHYSICAL_ADDRESS.Ptr, PhysicalAddressToMap, ExplicitLogicalAddressMarshal, ExplicitLogicalAddress, MinLogicalAddressMarshal, MinLogicalAddress, MaxLogicalAddressMarshal, MaxLogicalAddress, LogicalAddressOutMarshal, LogicalAddressOut, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A IOMMU_MAP_LOGICAL_RANGE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_MAP_LOGICAL_RANGE_EX {
        /**
         * Creates a IOMMU_MAP_LOGICAL_RANGE_EX pointer that invokes the given AHK function when called.
         * @param {Func(IOMMU_DMA_DOMAIN, UInt32, IOMMU_MAP_PHYSICAL_ADDRESS, "uint*", "uint*", "uint*", "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IOMMU_DMA_DOMAIN.Ptr, UInt32, IOMMU_MAP_PHYSICAL_ADDRESS.Ptr, "uint*", "uint*", "uint*", "uint*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
