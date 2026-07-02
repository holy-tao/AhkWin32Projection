#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IOMMU_DMA_DOMAIN_CREATION_FLAGS.ahk" { IOMMU_DMA_DOMAIN_CREATION_FLAGS }
#Import ".\IOMMU_DMA_RESERVED_REGION.ahk" { IOMMU_DMA_RESERVED_REGION }
#Import "..\..\Foundation\IOMMU_DMA_DOMAIN.ahk" { IOMMU_DMA_DOMAIN }
#Import ".\IOMMU_DMA_DOMAIN_TYPE.ahk" { IOMMU_DMA_DOMAIN_TYPE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\IOMMU_DMA_LOGICAL_ALLOCATOR_CONFIG.ahk" { IOMMU_DMA_LOGICAL_ALLOCATOR_CONFIG }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_DOMAIN_CREATE_EX {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_DOMAIN_CREATE_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IOMMU_DMA_DOMAIN_TYPE} DomainType 
     * @param {IOMMU_DMA_DOMAIN_CREATION_FLAGS} Flags 
     * @param {Pointer<IOMMU_DMA_LOGICAL_ALLOCATOR_CONFIG>} LogicalAllocatorConfig 
     * @param {Pointer<IOMMU_DMA_RESERVED_REGION>} ReservedRegions 
     * @param {Pointer<Pointer<IOMMU_DMA_DOMAIN>>} DomainOut 
     * @returns {NTSTATUS} 
     */
    Call(DomainType, Flags, LogicalAllocatorConfig, ReservedRegions, DomainOut) {
        DomainOutMarshal := DomainOut is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, IOMMU_DMA_DOMAIN_TYPE, DomainType, IOMMU_DMA_DOMAIN_CREATION_FLAGS, Flags, IOMMU_DMA_LOGICAL_ALLOCATOR_CONFIG.Ptr, LogicalAllocatorConfig, IOMMU_DMA_RESERVED_REGION.Ptr, ReservedRegions, DomainOutMarshal, DomainOut, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A IOMMU_DOMAIN_CREATE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_DOMAIN_CREATE_EX {
        /**
         * Creates a IOMMU_DOMAIN_CREATE_EX pointer that invokes the given AHK function when called.
         * @param {Func(IOMMU_DMA_DOMAIN_TYPE, IOMMU_DMA_DOMAIN_CREATION_FLAGS, IOMMU_DMA_LOGICAL_ALLOCATOR_CONFIG, IOMMU_DMA_RESERVED_REGION, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IOMMU_DMA_DOMAIN_TYPE, IOMMU_DMA_DOMAIN_CREATION_FLAGS, IOMMU_DMA_LOGICAL_ALLOCATOR_CONFIG.Ptr, IOMMU_DMA_RESERVED_REGION.Ptr, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
