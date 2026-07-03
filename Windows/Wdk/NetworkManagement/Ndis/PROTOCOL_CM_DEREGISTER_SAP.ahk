#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct PROTOCOL_CM_DEREGISTER_SAP {
    value : IntPtr

    __value {
        set {
            if (value is PROTOCOL_CM_DEREGISTER_SAP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} CallMgrSapContext 
     * @returns {Integer} 
     */
    Call(CallMgrSapContext) {
        CallMgrSapContextMarshal := CallMgrSapContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CallMgrSapContextMarshal, CallMgrSapContext, Int32)
        return result
    }

    /**
     * A PROTOCOL_CM_DEREGISTER_SAP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PROTOCOL_CM_DEREGISTER_SAP {
        /**
         * Creates a PROTOCOL_CM_DEREGISTER_SAP pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
