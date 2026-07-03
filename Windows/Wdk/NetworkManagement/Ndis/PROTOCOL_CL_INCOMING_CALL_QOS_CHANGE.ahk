#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CO_CALL_PARAMETERS.ahk" { CO_CALL_PARAMETERS }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct PROTOCOL_CL_INCOMING_CALL_QOS_CHANGE {
    value : IntPtr

    __value {
        set {
            if (value is PROTOCOL_CL_INCOMING_CALL_QOS_CHANGE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} ProtocolVcContext 
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ProtocolVcContext, CallParameters) {
        ProtocolVcContextMarshal := ProtocolVcContext is VarRef ? "ptr" : "ptr"
        CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

        DllCall(this.value, ProtocolVcContextMarshal, ProtocolVcContext, CallParametersMarshal, CallParameters)
    }

    /**
     * A PROTOCOL_CL_INCOMING_CALL_QOS_CHANGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PROTOCOL_CL_INCOMING_CALL_QOS_CHANGE {
        /**
         * Creates a PROTOCOL_CL_INCOMING_CALL_QOS_CHANGE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", CO_CALL_PARAMETERS) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", CO_CALL_PARAMETERS.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
