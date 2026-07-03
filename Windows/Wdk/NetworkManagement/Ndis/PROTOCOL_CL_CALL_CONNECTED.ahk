#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct PROTOCOL_CL_CALL_CONNECTED {
    value : IntPtr

    __value {
        set {
            if (value is PROTOCOL_CL_CALL_CONNECTED) {
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
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ProtocolVcContext) {
        ProtocolVcContextMarshal := ProtocolVcContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, ProtocolVcContextMarshal, ProtocolVcContext)
    }

    /**
     * A PROTOCOL_CL_CALL_CONNECTED that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PROTOCOL_CL_CALL_CONNECTED {
        /**
         * Creates a PROTOCOL_CL_CALL_CONNECTED pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
