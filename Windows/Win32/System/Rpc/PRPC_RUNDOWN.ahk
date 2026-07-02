#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct PRPC_RUNDOWN {
    value : IntPtr

    __value {
        set {
            if (value is PRPC_RUNDOWN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} AssociationContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(AssociationContext) {
        AssociationContextMarshal := AssociationContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, AssociationContextMarshal, AssociationContext)
    }

    /**
     * A PRPC_RUNDOWN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRPC_RUNDOWN {
        /**
         * Creates a PRPC_RUNDOWN pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
