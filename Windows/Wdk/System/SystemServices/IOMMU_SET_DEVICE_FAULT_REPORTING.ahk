#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\DEVICE_FAULT_CONFIGURATION.ahk" { DEVICE_FAULT_CONFIGURATION }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_SET_DEVICE_FAULT_REPORTING {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_SET_DEVICE_FAULT_REPORTING) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Integer} InputMappingIdBase 
     * @param {BOOLEAN} Enable 
     * @param {Pointer<DEVICE_FAULT_CONFIGURATION>} FaultConfig 
     * @returns {NTSTATUS} 
     */
    Call(PhysicalDeviceObject, InputMappingIdBase, Enable, FaultConfig) {
        result := DllCall(this.value, DEVICE_OBJECT.Ptr, PhysicalDeviceObject, UInt32, InputMappingIdBase, BOOLEAN, Enable, DEVICE_FAULT_CONFIGURATION.Ptr, FaultConfig, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A IOMMU_SET_DEVICE_FAULT_REPORTING that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_SET_DEVICE_FAULT_REPORTING {
        /**
         * Creates a IOMMU_SET_DEVICE_FAULT_REPORTING pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, UInt32, BOOLEAN, DEVICE_FAULT_CONFIGURATION) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, UInt32, BOOLEAN, DEVICE_FAULT_CONFIGURATION.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
