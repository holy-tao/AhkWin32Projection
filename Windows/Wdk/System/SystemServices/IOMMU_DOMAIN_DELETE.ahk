#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\IOMMU_DMA_DOMAIN.ahk" { IOMMU_DMA_DOMAIN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_DOMAIN_DELETE {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_DOMAIN_DELETE) {
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
     * @returns {NTSTATUS} 
     */
    Call(Domain) {
        DomainMarshal := Domain is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DomainMarshal, Domain, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A IOMMU_DOMAIN_DELETE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_DOMAIN_DELETE {
        /**
         * Creates a IOMMU_DOMAIN_DELETE pointer that invokes the given AHK function when called.
         * @param {Func(IOMMU_DMA_DOMAIN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IOMMU_DMA_DOMAIN.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
