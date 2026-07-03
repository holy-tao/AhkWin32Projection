#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct CL_INCOMING_CLOSE_CALL_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is CL_INCOMING_CLOSE_CALL_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Call() {
        DllCall(this.value)
    }

    /**
     * A CL_INCOMING_CLOSE_CALL_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CL_INCOMING_CLOSE_CALL_HANDLER {
        /**
         * Creates a CL_INCOMING_CLOSE_CALL_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func() => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
