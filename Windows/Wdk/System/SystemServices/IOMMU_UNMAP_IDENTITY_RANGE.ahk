#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\IOMMU_DMA_DOMAIN.ahk" { IOMMU_DMA_DOMAIN }
#Import "..\..\Foundation\MDL.ahk" { MDL }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_UNMAP_IDENTITY_RANGE {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_UNMAP_IDENTITY_RANGE) {
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
     * @param {Pointer<MDL>} _Mdl 
     * @returns {NTSTATUS} 
     */
    Call(Domain, _Mdl) {
        DomainMarshal := Domain is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DomainMarshal, Domain, MDL.Ptr, _Mdl, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A IOMMU_UNMAP_IDENTITY_RANGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_UNMAP_IDENTITY_RANGE {
        /**
         * Creates a IOMMU_UNMAP_IDENTITY_RANGE pointer that invokes the given AHK function when called.
         * @param {Func(IOMMU_DMA_DOMAIN, MDL) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IOMMU_DMA_DOMAIN.Ptr, MDL.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
