#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\Foundation\IOMMU_DMA_DEVICE.ahk" { IOMMU_DMA_DEVICE }
#Import ".\IOMMU_DEVICE_CREATION_CONFIGURATION.ahk" { IOMMU_DEVICE_CREATION_CONFIGURATION }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_DEVICE_CREATE {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_DEVICE_CREATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<IOMMU_DEVICE_CREATION_CONFIGURATION>} DeviceConfig 
     * @param {Pointer<Pointer<IOMMU_DMA_DEVICE>>} DmaDeviceOut 
     * @returns {NTSTATUS} 
     */
    Call(DeviceObject, DeviceConfig, DmaDeviceOut) {
        DmaDeviceOutMarshal := DmaDeviceOut is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DEVICE_OBJECT.Ptr, DeviceObject, IOMMU_DEVICE_CREATION_CONFIGURATION.Ptr, DeviceConfig, DmaDeviceOutMarshal, DmaDeviceOut, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A IOMMU_DEVICE_CREATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_DEVICE_CREATE {
        /**
         * Creates a IOMMU_DEVICE_CREATE pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, IOMMU_DEVICE_CREATION_CONFIGURATION, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, IOMMU_DEVICE_CREATION_CONFIGURATION.Ptr, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
