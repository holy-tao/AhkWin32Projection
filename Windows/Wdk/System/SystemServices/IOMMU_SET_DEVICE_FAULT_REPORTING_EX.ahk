#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_FAULT_CONFIGURATION.ahk" { DEVICE_FAULT_CONFIGURATION }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\Foundation\IOMMU_DMA_DEVICE.ahk" { IOMMU_DMA_DEVICE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_SET_DEVICE_FAULT_REPORTING_EX {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_SET_DEVICE_FAULT_REPORTING_EX) {
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
     * @param {Integer} InputMappingIdBase 
     * @param {BOOLEAN} Enable 
     * @param {Pointer<DEVICE_FAULT_CONFIGURATION>} FaultConfig 
     * @returns {NTSTATUS} 
     */
    Call(DmaDevice, InputMappingIdBase, Enable, FaultConfig) {
        DmaDeviceMarshal := DmaDevice is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DmaDeviceMarshal, DmaDevice, UInt32, InputMappingIdBase, BOOLEAN, Enable, DEVICE_FAULT_CONFIGURATION.Ptr, FaultConfig, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A IOMMU_SET_DEVICE_FAULT_REPORTING_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_SET_DEVICE_FAULT_REPORTING_EX {
        /**
         * Creates a IOMMU_SET_DEVICE_FAULT_REPORTING_EX pointer that invokes the given AHK function when called.
         * @param {Func(IOMMU_DMA_DEVICE, UInt32, BOOLEAN, DEVICE_FAULT_CONFIGURATION) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IOMMU_DMA_DEVICE.Ptr, UInt32, BOOLEAN, DEVICE_FAULT_CONFIGURATION.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
