#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\IOMMU_DMA_DEVICE.ahk" { IOMMU_DMA_DEVICE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_DEVICE_QUERY_DOMAIN_TYPES {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_DEVICE_QUERY_DOMAIN_TYPES) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<IOMMU_DMA_DEVICE>} DmaDevice 
     * @param {Pointer<Integer>} AvailableDomains 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DmaDevice, AvailableDomains) {
        DmaDeviceMarshal := DmaDevice is VarRef ? "ptr*" : "ptr"
        AvailableDomainsMarshal := AvailableDomains is VarRef ? "uint*" : "ptr"

        DllCall(this.value, DmaDeviceMarshal, DmaDevice, AvailableDomainsMarshal, AvailableDomains)
    }

    /**
     * A IOMMU_DEVICE_QUERY_DOMAIN_TYPES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_DEVICE_QUERY_DOMAIN_TYPES {
        /**
         * Creates a IOMMU_DEVICE_QUERY_DOMAIN_TYPES pointer that invokes the given AHK function when called.
         * @param {Func(IOMMU_DMA_DEVICE, "uint*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IOMMU_DMA_DEVICE.Ptr, "uint*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
