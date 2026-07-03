#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KBUGCHECK_CALLBACK_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is KBUGCHECK_CALLBACK_ROUTINE) {
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
     * @param {Integer} Length 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Buffer, Length) {
        _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _BufferMarshal, _Buffer, UInt32, Length)
    }

    /**
     * A KBUGCHECK_CALLBACK_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KBUGCHECK_CALLBACK_ROUTINE {
        /**
         * Creates a KBUGCHECK_CALLBACK_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
