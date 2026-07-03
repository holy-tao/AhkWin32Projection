#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CO_SAP.ahk" { CO_SAP }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct PROTOCOL_CM_REG_SAP {
    value : IntPtr

    __value {
        set {
            if (value is PROTOCOL_CM_REG_SAP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} CallMgrAfContext 
     * @param {Pointer<CO_SAP>} Sap 
     * @param {Pointer<Void>} NdisSapHandle 
     * @param {Pointer<Pointer<Void>>} CallMgrSapContext 
     * @returns {Integer} 
     */
    Call(CallMgrAfContext, Sap, NdisSapHandle, CallMgrSapContext) {
        CallMgrAfContextMarshal := CallMgrAfContext is VarRef ? "ptr" : "ptr"
        NdisSapHandleMarshal := NdisSapHandle is VarRef ? "ptr" : "ptr"
        CallMgrSapContextMarshal := CallMgrSapContext is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, CallMgrAfContextMarshal, CallMgrAfContext, CO_SAP.Ptr, Sap, NdisSapHandleMarshal, NdisSapHandle, CallMgrSapContextMarshal, CallMgrSapContext, Int32)
        return result
    }

    /**
     * A PROTOCOL_CM_REG_SAP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PROTOCOL_CM_REG_SAP {
        /**
         * Creates a PROTOCOL_CM_REG_SAP pointer that invokes the given AHK function when called.
         * @param {Func("ptr", CO_SAP, "ptr", "ptr*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", CO_SAP.Ptr, "ptr", "ptr*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
