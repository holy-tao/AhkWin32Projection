#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\IOMMU_DMA_DEVICE.ahk" { IOMMU_DMA_DEVICE }
#Import ".\IOMMU_INTERFACE_STATE_CHANGE_FIELDS.ahk" { IOMMU_INTERFACE_STATE_CHANGE_FIELDS }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_REGISTER_INTERFACE_STATE_CHANGE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_REGISTER_INTERFACE_STATE_CHANGE_CALLBACK) {
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
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<IOMMU_DMA_DEVICE>} DmaDevice 
     * @param {Pointer<IOMMU_INTERFACE_STATE_CHANGE_FIELDS>} StateFields 
     * @returns {NTSTATUS} 
     */
    Call(StateChangeCallback, _Context, DmaDevice, StateFields) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        DmaDeviceMarshal := DmaDevice is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "ptr", StateChangeCallback, _ContextMarshal, _Context, DmaDeviceMarshal, DmaDevice, IOMMU_INTERFACE_STATE_CHANGE_FIELDS.Ptr, StateFields, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A IOMMU_REGISTER_INTERFACE_STATE_CHANGE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_REGISTER_INTERFACE_STATE_CHANGE_CALLBACK {
        /**
         * Creates a IOMMU_REGISTER_INTERFACE_STATE_CHANGE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", IOMMU_DMA_DEVICE, IOMMU_INTERFACE_STATE_CHANGE_FIELDS) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", IOMMU_DMA_DEVICE.Ptr, IOMMU_INTERFACE_STATE_CHANGE_FIELDS.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
