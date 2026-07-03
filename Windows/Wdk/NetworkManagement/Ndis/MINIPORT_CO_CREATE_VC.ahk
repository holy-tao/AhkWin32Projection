#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct MINIPORT_CO_CREATE_VC {
    value : IntPtr

    __value {
        set {
            if (value is MINIPORT_CO_CREATE_VC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} MiniportAdapterContext 
     * @param {Pointer<Void>} NdisVcHandle 
     * @param {Pointer<Pointer<Void>>} MiniportVcContext 
     * @returns {Integer} 
     */
    Call(MiniportAdapterContext, NdisVcHandle, MiniportVcContext) {
        MiniportAdapterContextMarshal := MiniportAdapterContext is VarRef ? "ptr" : "ptr"
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
        MiniportVcContextMarshal := MiniportVcContext is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, MiniportAdapterContextMarshal, MiniportAdapterContext, NdisVcHandleMarshal, NdisVcHandle, MiniportVcContextMarshal, MiniportVcContext, Int32)
        return result
    }

    /**
     * A MINIPORT_CO_CREATE_VC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MINIPORT_CO_CREATE_VC {
        /**
         * Creates a MINIPORT_CO_CREATE_VC pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", "ptr*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", "ptr*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
