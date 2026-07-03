#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CO_CALL_PARAMETERS.ahk" { CO_CALL_PARAMETERS }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct PROTOCOL_CL_INCOMING_CALL {
    value : IntPtr

    __value {
        set {
            if (value is PROTOCOL_CL_INCOMING_CALL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} ProtocolSapContext 
     * @param {Pointer<Void>} ProtocolVcContext 
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @returns {Integer} 
     */
    Call(ProtocolSapContext, ProtocolVcContext, CallParameters) {
        ProtocolSapContextMarshal := ProtocolSapContext is VarRef ? "ptr" : "ptr"
        ProtocolVcContextMarshal := ProtocolVcContext is VarRef ? "ptr" : "ptr"
        CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, ProtocolSapContextMarshal, ProtocolSapContext, ProtocolVcContextMarshal, ProtocolVcContext, CallParametersMarshal, CallParameters, Int32)
        return result
    }

    /**
     * A PROTOCOL_CL_INCOMING_CALL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PROTOCOL_CL_INCOMING_CALL {
        /**
         * Creates a PROTOCOL_CL_INCOMING_CALL pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", CO_CALL_PARAMETERS) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", CO_CALL_PARAMETERS.Ptr, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
