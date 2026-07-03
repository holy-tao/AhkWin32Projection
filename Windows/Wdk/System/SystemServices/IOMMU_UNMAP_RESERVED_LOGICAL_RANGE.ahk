#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IOMMU_DMA_LOGICAL_ADDRESS_TOKEN_MAPPED_SEGMENT.ahk" { IOMMU_DMA_LOGICAL_ADDRESS_TOKEN_MAPPED_SEGMENT }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_UNMAP_RESERVED_LOGICAL_RANGE {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_UNMAP_RESERVED_LOGICAL_RANGE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<IOMMU_DMA_LOGICAL_ADDRESS_TOKEN_MAPPED_SEGMENT>} MappedSegment 
     * @returns {NTSTATUS} 
     */
    Call(MappedSegment) {
        result := DllCall(this.value, IOMMU_DMA_LOGICAL_ADDRESS_TOKEN_MAPPED_SEGMENT.Ptr, MappedSegment, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A IOMMU_UNMAP_RESERVED_LOGICAL_RANGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_UNMAP_RESERVED_LOGICAL_RANGE {
        /**
         * Creates a IOMMU_UNMAP_RESERVED_LOGICAL_RANGE pointer that invokes the given AHK function when called.
         * @param {Func(IOMMU_DMA_LOGICAL_ADDRESS_TOKEN_MAPPED_SEGMENT) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IOMMU_DMA_LOGICAL_ADDRESS_TOKEN_MAPPED_SEGMENT.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
