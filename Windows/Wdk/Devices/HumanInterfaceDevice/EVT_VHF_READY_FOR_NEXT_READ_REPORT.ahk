#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Devices.HumanInterfaceDevice
 */
export default struct EVT_VHF_READY_FOR_NEXT_READ_REPORT {
    value : IntPtr

    __value {
        set {
            if (value is EVT_VHF_READY_FOR_NEXT_READ_REPORT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} VhfClientContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(VhfClientContext) {
        VhfClientContextMarshal := VhfClientContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, VhfClientContextMarshal, VhfClientContext)
    }

    /**
     * A EVT_VHF_READY_FOR_NEXT_READ_REPORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EVT_VHF_READY_FOR_NEXT_READ_REPORT {
        /**
         * Creates a EVT_VHF_READY_FOR_NEXT_READ_REPORT pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
