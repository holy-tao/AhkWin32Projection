#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_GET_KEY_FN {
    value : IntPtr

    __value {
        set {
            if (value is SEC_GET_KEY_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Arg 
     * @param {Pointer<Void>} Principal 
     * @param {Integer} KeyVer 
     * @param {Pointer<Pointer<Void>>} Key 
     * @param {Pointer<HRESULT>} _Status 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Arg, Principal, KeyVer, Key, _Status) {
        ArgMarshal := Arg is VarRef ? "ptr" : "ptr"
        PrincipalMarshal := Principal is VarRef ? "ptr" : "ptr"
        KeyMarshal := Key is VarRef ? "ptr*" : "ptr"
        _StatusMarshal := _Status is VarRef ? "int*" : "ptr"

        DllCall(this.value, ArgMarshal, Arg, PrincipalMarshal, Principal, UInt32, KeyVer, KeyMarshal, Key, _StatusMarshal, _Status)
    }

    /**
     * A SEC_GET_KEY_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SEC_GET_KEY_FN {
        /**
         * Creates a SEC_GET_KEY_FN pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", UInt32, "ptr*", "int*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", UInt32, "ptr*", "int*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
