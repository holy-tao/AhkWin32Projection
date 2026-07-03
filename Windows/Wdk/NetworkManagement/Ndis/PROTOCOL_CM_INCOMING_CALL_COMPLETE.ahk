#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CO_CALL_PARAMETERS.ahk" { CO_CALL_PARAMETERS }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct PROTOCOL_CM_INCOMING_CALL_COMPLETE {
    value : IntPtr

    __value {
        set {
            if (value is PROTOCOL_CM_INCOMING_CALL_COMPLETE) {
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
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Status, CallMgrVcContext, CallParameters) {
        CallMgrVcContextMarshal := CallMgrVcContext is VarRef ? "ptr" : "ptr"
        CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

        DllCall(this.value, Int32, _Status, CallMgrVcContextMarshal, CallMgrVcContext, CallParametersMarshal, CallParameters)
    }

    /**
     * A PROTOCOL_CM_INCOMING_CALL_COMPLETE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PROTOCOL_CM_INCOMING_CALL_COMPLETE {
        /**
         * Creates a PROTOCOL_CM_INCOMING_CALL_COMPLETE pointer that invokes the given AHK function when called.
         * @param {Func(Int32, "ptr", CO_CALL_PARAMETERS) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32, "ptr", CO_CALL_PARAMETERS.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
