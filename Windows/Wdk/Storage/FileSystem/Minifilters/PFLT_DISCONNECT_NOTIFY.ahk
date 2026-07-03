#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_DISCONNECT_NOTIFY {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_DISCONNECT_NOTIFY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} ConnectionCookie 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ConnectionCookie) {
        ConnectionCookieMarshal := ConnectionCookie is VarRef ? "ptr" : "ptr"

        DllCall(this.value, ConnectionCookieMarshal, ConnectionCookie)
    }

    /**
     * A PFLT_DISCONNECT_NOTIFY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_DISCONNECT_NOTIFY {
        /**
         * Creates a PFLT_DISCONNECT_NOTIFY pointer that invokes the given AHK function when called.
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
