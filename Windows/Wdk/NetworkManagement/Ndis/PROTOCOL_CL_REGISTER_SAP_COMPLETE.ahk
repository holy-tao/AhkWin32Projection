#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CO_SAP.ahk" { CO_SAP }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct PROTOCOL_CL_REGISTER_SAP_COMPLETE {
    value : IntPtr

    __value {
        set {
            if (value is PROTOCOL_CL_REGISTER_SAP_COMPLETE) {
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
     * @param {Pointer<Void>} ProtocolSapContext 
     * @param {Pointer<CO_SAP>} Sap 
     * @param {Pointer<Void>} NdisSapHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Status, ProtocolSapContext, Sap, NdisSapHandle) {
        ProtocolSapContextMarshal := ProtocolSapContext is VarRef ? "ptr" : "ptr"
        NdisSapHandleMarshal := NdisSapHandle is VarRef ? "ptr" : "ptr"

        DllCall(this.value, Int32, _Status, ProtocolSapContextMarshal, ProtocolSapContext, CO_SAP.Ptr, Sap, NdisSapHandleMarshal, NdisSapHandle)
    }

    /**
     * A PROTOCOL_CL_REGISTER_SAP_COMPLETE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PROTOCOL_CL_REGISTER_SAP_COMPLETE {
        /**
         * Creates a PROTOCOL_CL_REGISTER_SAP_COMPLETE pointer that invokes the given AHK function when called.
         * @param {Func(Int32, "ptr", CO_SAP, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32, "ptr", CO_SAP.Ptr, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
