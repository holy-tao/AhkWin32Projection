#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\IOMMU_DMA_DOMAIN.ahk" { IOMMU_DMA_DOMAIN }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_DOMAIN_CREATE {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_DOMAIN_CREATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BOOLEAN} OsManagedPageTable 
     * @param {Pointer<Pointer<IOMMU_DMA_DOMAIN>>} DomainOut 
     * @returns {NTSTATUS} 
     */
    Call(OsManagedPageTable, DomainOut) {
        DomainOutMarshal := DomainOut is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, BOOLEAN, OsManagedPageTable, DomainOutMarshal, DomainOut, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A IOMMU_DOMAIN_CREATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_DOMAIN_CREATE {
        /**
         * Creates a IOMMU_DOMAIN_CREATE pointer that invokes the given AHK function when called.
         * @param {Func(BOOLEAN, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BOOLEAN, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
