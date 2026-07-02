#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct CM_ACTIVATE_VC_COMPLETE_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is CM_ACTIVATE_VC_COMPLETE_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Call() {
        DllCall(this.value)
    }

    /**
     * A CM_ACTIVATE_VC_COMPLETE_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CM_ACTIVATE_VC_COMPLETE_HANDLER {
        /**
         * Creates a CM_ACTIVATE_VC_COMPLETE_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func() => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
