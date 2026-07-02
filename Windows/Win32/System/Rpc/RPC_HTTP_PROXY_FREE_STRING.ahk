#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_HTTP_PROXY_FREE_STRING {
    value : IntPtr

    __value {
        set {
            if (value is RPC_HTTP_PROXY_FREE_STRING) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} _String 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_String) {
        _String := _String is String ? StrPtr(_String) : _String

        DllCall(this.value, "ptr", _String)
    }

    /**
     * A RPC_HTTP_PROXY_FREE_STRING that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RPC_HTTP_PROXY_FREE_STRING {
        /**
         * Creates a RPC_HTTP_PROXY_FREE_STRING pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
