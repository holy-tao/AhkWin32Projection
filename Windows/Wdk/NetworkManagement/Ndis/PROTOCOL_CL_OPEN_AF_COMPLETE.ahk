#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct PROTOCOL_CL_OPEN_AF_COMPLETE {
    value : IntPtr

    __value {
        set {
            if (value is PROTOCOL_CL_OPEN_AF_COMPLETE) {
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
     * @param {Pointer<Void>} ProtocolAfContext 
     * @param {Pointer<Void>} NdisAfHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Status, ProtocolAfContext, NdisAfHandle) {
        ProtocolAfContextMarshal := ProtocolAfContext is VarRef ? "ptr" : "ptr"
        NdisAfHandleMarshal := NdisAfHandle is VarRef ? "ptr" : "ptr"

        DllCall(this.value, Int32, _Status, ProtocolAfContextMarshal, ProtocolAfContext, NdisAfHandleMarshal, NdisAfHandle)
    }

    /**
     * A PROTOCOL_CL_OPEN_AF_COMPLETE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PROTOCOL_CL_OPEN_AF_COMPLETE {
        /**
         * Creates a PROTOCOL_CL_OPEN_AF_COMPLETE pointer that invokes the given AHK function when called.
         * @param {Func(Int32, "ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32, "ptr", "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
