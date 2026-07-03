#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\IOMMU_DMA_DEVICE.ahk" { IOMMU_DMA_DEVICE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_DEVICE_DELETE {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_DEVICE_DELETE) {
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
     * @returns {NTSTATUS} 
     */
    Call(DmaDevice) {
        DmaDeviceMarshal := DmaDevice is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DmaDeviceMarshal, DmaDevice, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A IOMMU_DEVICE_DELETE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_DEVICE_DELETE {
        /**
         * Creates a IOMMU_DEVICE_DELETE pointer that invokes the given AHK function when called.
         * @param {Func(IOMMU_DMA_DEVICE) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IOMMU_DMA_DEVICE.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
