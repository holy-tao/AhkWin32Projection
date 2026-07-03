#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct PROTOCOL_CM_DEACTIVATE_VC_COMPLETE {
    value : IntPtr

    __value {
        set {
            if (value is PROTOCOL_CM_DEACTIVATE_VC_COMPLETE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} _Status 
     * @param {Pointer<Void>} CallMgrVcContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Status, CallMgrVcContext) {
        CallMgrVcContextMarshal := CallMgrVcContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, Int32, _Status, CallMgrVcContextMarshal, CallMgrVcContext)
    }

    /**
     * A PROTOCOL_CM_DEACTIVATE_VC_COMPLETE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PROTOCOL_CM_DEACTIVATE_VC_COMPLETE {
        /**
         * Creates a PROTOCOL_CM_DEACTIVATE_VC_COMPLETE pointer that invokes the given AHK function when called.
         * @param {Func(Int32, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
