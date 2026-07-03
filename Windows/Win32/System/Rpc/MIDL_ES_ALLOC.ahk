#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct MIDL_ES_ALLOC {
    value : IntPtr

    __value {
        set {
            if (value is MIDL_ES_ALLOC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} state 
     * @param {Pointer<Pointer<Integer>>} pbuffer 
     * @param {Pointer<Integer>} psize 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(state, pbuffer, psize) {
        stateMarshal := state is VarRef ? "ptr" : "ptr"
        pbufferMarshal := pbuffer is VarRef ? "ptr*" : "ptr"
        psizeMarshal := psize is VarRef ? "uint*" : "ptr"

        DllCall(this.value, stateMarshal, state, pbufferMarshal, pbuffer, psizeMarshal, psize)
    }

    /**
     * A MIDL_ES_ALLOC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MIDL_ES_ALLOC {
        /**
         * Creates a MIDL_ES_ALLOC pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr*", "uint*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr*", "uint*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
