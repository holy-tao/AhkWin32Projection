#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\PIOMMU_INTERFACE_STATE_CHANGE_CALLBACK.ahk" { PIOMMU_INTERFACE_STATE_CHANGE_CALLBACK }
#Import "..\..\Foundation\IOMMU_DMA_DEVICE.ahk" { IOMMU_DMA_DEVICE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_UNREGISTER_INTERFACE_STATE_CHANGE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_UNREGISTER_INTERFACE_STATE_CHANGE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<PIOMMU_INTERFACE_STATE_CHANGE_CALLBACK>} StateChangeCallback 
     * @param {Pointer<IOMMU_DMA_DEVICE>} DmaDevice 
     * @returns {NTSTATUS} 
     */
    Call(StateChangeCallback, DmaDevice) {
        DmaDeviceMarshal := DmaDevice is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, PIOMMU_INTERFACE_STATE_CHANGE_CALLBACK, StateChangeCallback, DmaDeviceMarshal, DmaDevice, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A IOMMU_UNREGISTER_INTERFACE_STATE_CHANGE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_UNREGISTER_INTERFACE_STATE_CHANGE_CALLBACK {
        /**
         * Creates a IOMMU_UNREGISTER_INTERFACE_STATE_CHANGE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PIOMMU_INTERFACE_STATE_CHANGE_CALLBACK, IOMMU_DMA_DEVICE) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PIOMMU_INTERFACE_STATE_CHANGE_CALLBACK, IOMMU_DMA_DEVICE.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
