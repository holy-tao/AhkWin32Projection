#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CO_CALL_PARAMETERS.ahk" { CO_CALL_PARAMETERS }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct PROTOCOL_CM_MODIFY_QOS_CALL {
    value : IntPtr

    __value {
        set {
            if (value is PROTOCOL_CM_MODIFY_QOS_CALL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} CallMgrVcContext 
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @returns {Integer} 
     */
    Call(CallMgrVcContext, CallParameters) {
        CallMgrVcContextMarshal := CallMgrVcContext is VarRef ? "ptr" : "ptr"
        CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, CallMgrVcContextMarshal, CallMgrVcContext, CallParametersMarshal, CallParameters, Int32)
        return result
    }

    /**
     * A PROTOCOL_CM_MODIFY_QOS_CALL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PROTOCOL_CM_MODIFY_QOS_CALL {
        /**
         * Creates a PROTOCOL_CM_MODIFY_QOS_CALL pointer that invokes the given AHK function when called.
         * @param {Func("ptr", CO_CALL_PARAMETERS) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", CO_CALL_PARAMETERS.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
