#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct LPOCNDSCPROC {
    value : IntPtr

    __value {
        set {
            if (value is LPOCNDSCPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} param0 
     * @param {Pointer} param1 
     * @param {Pointer<Void>} param2 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1, param2) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, IntPtr, param0, IntPtr, param1, param2Marshal, param2)
    }

    /**
     * A LPOCNDSCPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPOCNDSCPROC {
        /**
         * Creates a LPOCNDSCPROC pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
