#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} CallerContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CallerContext) {
        CallerContextMarshal := CallerContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, CallerContextMarshal, CallerContext)
    }

    /**
     * A PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK {
        /**
         * Creates a PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK pointer that invokes the given AHK function when called.
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
