#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\IOMMU_DMA_DOMAIN.ahk" { IOMMU_DMA_DOMAIN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_UNMAP_LOGICAL_RANGE {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_UNMAP_LOGICAL_RANGE) {
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
     * @param {Integer} LogicalAddress 
     * @param {Integer} NumberOfPages 
     * @returns {NTSTATUS} 
     */
    Call(Domain, LogicalAddress, NumberOfPages) {
        DomainMarshal := Domain is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DomainMarshal, Domain, Int64, LogicalAddress, Int64, NumberOfPages, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A IOMMU_UNMAP_LOGICAL_RANGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_UNMAP_LOGICAL_RANGE {
        /**
         * Creates a IOMMU_UNMAP_LOGICAL_RANGE pointer that invokes the given AHK function when called.
         * @param {Func(IOMMU_DMA_DOMAIN, Int64, Int64) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IOMMU_DMA_DOMAIN.Ptr, Int64, Int64, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
