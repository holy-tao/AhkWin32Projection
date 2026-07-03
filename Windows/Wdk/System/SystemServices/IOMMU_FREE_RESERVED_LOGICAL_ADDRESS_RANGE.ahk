#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IOMMU_DMA_LOGICAL_ADDRESS_TOKEN.ahk" { IOMMU_DMA_LOGICAL_ADDRESS_TOKEN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_FREE_RESERVED_LOGICAL_ADDRESS_RANGE {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_FREE_RESERVED_LOGICAL_ADDRESS_RANGE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<IOMMU_DMA_LOGICAL_ADDRESS_TOKEN>} LogicalAddressToken 
     * @returns {NTSTATUS} 
     */
    Call(LogicalAddressToken) {
        result := DllCall(this.value, IOMMU_DMA_LOGICAL_ADDRESS_TOKEN.Ptr, LogicalAddressToken, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A IOMMU_FREE_RESERVED_LOGICAL_ADDRESS_RANGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_FREE_RESERVED_LOGICAL_ADDRESS_RANGE {
        /**
         * Creates a IOMMU_FREE_RESERVED_LOGICAL_ADDRESS_RANGE pointer that invokes the given AHK function when called.
         * @param {Func(IOMMU_DMA_LOGICAL_ADDRESS_TOKEN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IOMMU_DMA_LOGICAL_ADDRESS_TOKEN.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
