#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IOMMU_INTERFACE_STATE_CHANGE.ahk" { IOMMU_INTERFACE_STATE_CHANGE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_INTERFACE_STATE_CHANGE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_INTERFACE_STATE_CHANGE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<IOMMU_INTERFACE_STATE_CHANGE>} StateChange 
     * @param {Pointer<Void>} _Context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(StateChange, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, IOMMU_INTERFACE_STATE_CHANGE.Ptr, StateChange, _ContextMarshal, _Context)
    }

    /**
     * A IOMMU_INTERFACE_STATE_CHANGE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_INTERFACE_STATE_CHANGE_CALLBACK {
        /**
         * Creates a IOMMU_INTERFACE_STATE_CHANGE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(IOMMU_INTERFACE_STATE_CHANGE, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IOMMU_INTERFACE_STATE_CHANGE.Ptr, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
