#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct PROTOCOL_CL_INCOMING_CLOSE_CALL {
    value : IntPtr

    __value {
        set {
            if (value is PROTOCOL_CL_INCOMING_CLOSE_CALL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} CloseStatus 
     * @param {Pointer<Void>} ProtocolVcContext 
     * @param {Pointer<Void>} CloseData 
     * @param {Integer} _Size 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CloseStatus, ProtocolVcContext, CloseData, _Size) {
        ProtocolVcContextMarshal := ProtocolVcContext is VarRef ? "ptr" : "ptr"
        CloseDataMarshal := CloseData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, Int32, CloseStatus, ProtocolVcContextMarshal, ProtocolVcContext, CloseDataMarshal, CloseData, UInt32, _Size)
    }

    /**
     * A PROTOCOL_CL_INCOMING_CLOSE_CALL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PROTOCOL_CL_INCOMING_CLOSE_CALL {
        /**
         * Creates a PROTOCOL_CL_INCOMING_CLOSE_CALL pointer that invokes the given AHK function when called.
         * @param {Func(Int32, "ptr", "ptr", UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32, "ptr", "ptr", UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
