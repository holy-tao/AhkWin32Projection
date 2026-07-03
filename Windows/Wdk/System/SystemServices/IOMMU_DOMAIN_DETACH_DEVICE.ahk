#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\Foundation\IOMMU_DMA_DOMAIN.ahk" { IOMMU_DMA_DOMAIN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_DOMAIN_DETACH_DEVICE {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_DOMAIN_DETACH_DEVICE) {
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
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Integer} InputMappingId 
     * @returns {NTSTATUS} 
     */
    Call(Domain, PhysicalDeviceObject, InputMappingId) {
        DomainMarshal := Domain is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DomainMarshal, Domain, DEVICE_OBJECT.Ptr, PhysicalDeviceObject, UInt32, InputMappingId, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A IOMMU_DOMAIN_DETACH_DEVICE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_DOMAIN_DETACH_DEVICE {
        /**
         * Creates a IOMMU_DOMAIN_DETACH_DEVICE pointer that invokes the given AHK function when called.
         * @param {Func(IOMMU_DMA_DOMAIN, DEVICE_OBJECT, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IOMMU_DMA_DOMAIN.Ptr, DEVICE_OBJECT.Ptr, UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
