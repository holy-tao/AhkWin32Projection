#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_TIMER_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is NDIS_TIMER_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} SystemSpecific1 
     * @param {Pointer<Void>} FunctionContext 
     * @param {Pointer<Void>} SystemSpecific2 
     * @param {Pointer<Void>} SystemSpecific3 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(SystemSpecific1, FunctionContext, SystemSpecific2, SystemSpecific3) {
        SystemSpecific1Marshal := SystemSpecific1 is VarRef ? "ptr" : "ptr"
        FunctionContextMarshal := FunctionContext is VarRef ? "ptr" : "ptr"
        SystemSpecific2Marshal := SystemSpecific2 is VarRef ? "ptr" : "ptr"
        SystemSpecific3Marshal := SystemSpecific3 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, SystemSpecific1Marshal, SystemSpecific1, FunctionContextMarshal, FunctionContext, SystemSpecific2Marshal, SystemSpecific2, SystemSpecific3Marshal, SystemSpecific3)
    }

    /**
     * A NDIS_TIMER_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NDIS_TIMER_FUNCTION {
        /**
         * Creates a NDIS_TIMER_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", "ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", "ptr", "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
