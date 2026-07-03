#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CO_ADDRESS_FAMILY.ahk" { CO_ADDRESS_FAMILY }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct PROTOCOL_CM_OPEN_AF {
    value : IntPtr

    __value {
        set {
            if (value is PROTOCOL_CM_OPEN_AF) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} CallMgrBindingContext 
     * @param {Pointer<CO_ADDRESS_FAMILY>} AddressFamily 
     * @param {Pointer<Void>} NdisAfHandle 
     * @param {Pointer<Pointer<Void>>} CallMgrAfContext 
     * @returns {Integer} 
     */
    Call(CallMgrBindingContext, AddressFamily, NdisAfHandle, CallMgrAfContext) {
        CallMgrBindingContextMarshal := CallMgrBindingContext is VarRef ? "ptr" : "ptr"
        NdisAfHandleMarshal := NdisAfHandle is VarRef ? "ptr" : "ptr"
        CallMgrAfContextMarshal := CallMgrAfContext is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, CallMgrBindingContextMarshal, CallMgrBindingContext, CO_ADDRESS_FAMILY.Ptr, AddressFamily, NdisAfHandleMarshal, NdisAfHandle, CallMgrAfContextMarshal, CallMgrAfContext, Int32)
        return result
    }

    /**
     * A PROTOCOL_CM_OPEN_AF that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PROTOCOL_CM_OPEN_AF {
        /**
         * Creates a PROTOCOL_CM_OPEN_AF pointer that invokes the given AHK function when called.
         * @param {Func("ptr", CO_ADDRESS_FAMILY, "ptr", "ptr*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", CO_ADDRESS_FAMILY.Ptr, "ptr", "ptr*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
