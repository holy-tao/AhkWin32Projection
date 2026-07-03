#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\IOMMU_DMA_DOMAIN.ahk" { IOMMU_DMA_DOMAIN }
#Import ".\IOMMU_MAP_PHYSICAL_ADDRESS.ahk" { IOMMU_MAP_PHYSICAL_ADDRESS }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_UNMAP_IDENTITY_RANGE_EX {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_UNMAP_IDENTITY_RANGE_EX) {
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
     * @param {Pointer<IOMMU_MAP_PHYSICAL_ADDRESS>} MappedPhysicalAddress 
     * @returns {NTSTATUS} 
     */
    Call(Domain, MappedPhysicalAddress) {
        DomainMarshal := Domain is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DomainMarshal, Domain, IOMMU_MAP_PHYSICAL_ADDRESS.Ptr, MappedPhysicalAddress, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A IOMMU_UNMAP_IDENTITY_RANGE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_UNMAP_IDENTITY_RANGE_EX {
        /**
         * Creates a IOMMU_UNMAP_IDENTITY_RANGE_EX pointer that invokes the given AHK function when called.
         * @param {Func(IOMMU_DMA_DOMAIN, IOMMU_MAP_PHYSICAL_ADDRESS) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IOMMU_DMA_DOMAIN.Ptr, IOMMU_MAP_PHYSICAL_ADDRESS.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
