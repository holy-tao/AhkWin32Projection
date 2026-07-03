#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SET_D3COLD_SUPPORT {
    value : IntPtr

    __value {
        set {
            if (value is SET_D3COLD_SUPPORT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {BOOLEAN} D3ColdSupport 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Context, D3ColdSupport) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _ContextMarshal, _Context, BOOLEAN, D3ColdSupport)
    }

    /**
     * A SET_D3COLD_SUPPORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SET_D3COLD_SUPPORT {
        /**
         * Creates a SET_D3COLD_SUPPORT pointer that invokes the given AHK function when called.
         * @param {Func("ptr", BOOLEAN) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BOOLEAN, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
