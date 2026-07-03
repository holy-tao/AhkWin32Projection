#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAULT_INFORMATION.ahk" { FAULT_INFORMATION }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_DEVICE_FAULT_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_DEVICE_FAULT_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<FAULT_INFORMATION>} FaultInformation 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Context, FaultInformation) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _ContextMarshal, _Context, FAULT_INFORMATION.Ptr, FaultInformation)
    }

    /**
     * A IOMMU_DEVICE_FAULT_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_DEVICE_FAULT_HANDLER {
        /**
         * Creates a IOMMU_DEVICE_FAULT_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", FAULT_INFORMATION) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", FAULT_INFORMATION.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
