#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct PROTOCOL_CM_CLOSE_CALL {
    value : IntPtr

    __value {
        set {
            if (value is PROTOCOL_CM_CLOSE_CALL) {
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
     * @param {Pointer<Void>} CallMgrPartyContext 
     * @param {Pointer<Void>} CloseData 
     * @param {Integer} _Size 
     * @returns {Integer} 
     */
    Call(CallMgrVcContext, CallMgrPartyContext, CloseData, _Size) {
        CallMgrVcContextMarshal := CallMgrVcContext is VarRef ? "ptr" : "ptr"
        CallMgrPartyContextMarshal := CallMgrPartyContext is VarRef ? "ptr" : "ptr"
        CloseDataMarshal := CloseData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CallMgrVcContextMarshal, CallMgrVcContext, CallMgrPartyContextMarshal, CallMgrPartyContext, CloseDataMarshal, CloseData, UInt32, _Size, Int32)
        return result
    }

    /**
     * A PROTOCOL_CM_CLOSE_CALL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PROTOCOL_CM_CLOSE_CALL {
        /**
         * Creates a PROTOCOL_CM_CLOSE_CALL pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", "ptr", UInt32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", "ptr", UInt32, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
