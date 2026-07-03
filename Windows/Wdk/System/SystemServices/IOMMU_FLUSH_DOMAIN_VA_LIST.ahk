#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\IOMMU_DMA_DOMAIN.ahk" { IOMMU_DMA_DOMAIN }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_FLUSH_DOMAIN_VA_LIST {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_FLUSH_DOMAIN_VA_LIST) {
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
     * @param {BOOLEAN} LastLevel 
     * @param {Integer} _Number 
     * @param {Pointer<Void>} VaList 
     * @returns {NTSTATUS} 
     */
    Call(Domain, LastLevel, _Number, VaList) {
        DomainMarshal := Domain is VarRef ? "ptr*" : "ptr"
        VaListMarshal := VaList is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DomainMarshal, Domain, BOOLEAN, LastLevel, UInt32, _Number, VaListMarshal, VaList, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A IOMMU_FLUSH_DOMAIN_VA_LIST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_FLUSH_DOMAIN_VA_LIST {
        /**
         * Creates a IOMMU_FLUSH_DOMAIN_VA_LIST pointer that invokes the given AHK function when called.
         * @param {Func(IOMMU_DMA_DOMAIN, BOOLEAN, UInt32, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IOMMU_DMA_DOMAIN.Ptr, BOOLEAN, UInt32, "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
