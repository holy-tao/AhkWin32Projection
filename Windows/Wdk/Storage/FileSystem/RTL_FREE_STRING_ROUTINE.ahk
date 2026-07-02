#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct RTL_FREE_STRING_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is RTL_FREE_STRING_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Buffer 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Buffer) {
        _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _BufferMarshal, _Buffer)
    }

    /**
     * A RTL_FREE_STRING_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RTL_FREE_STRING_ROUTINE {
        /**
         * Creates a RTL_FREE_STRING_ROUTINE pointer that invokes the given AHK function when called.
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
