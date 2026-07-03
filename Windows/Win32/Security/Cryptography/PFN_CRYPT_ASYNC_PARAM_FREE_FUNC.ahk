#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_ASYNC_PARAM_FREE_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_ASYNC_PARAM_FREE_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} pszParamOid 
     * @param {Pointer<Void>} pvParam 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pszParamOid, pvParam) {
        pszParamOid := pszParamOid is String ? StrPtr(pszParamOid) : pszParamOid

        pvParamMarshal := pvParam is VarRef ? "ptr" : "ptr"

        DllCall(this.value, "ptr", pszParamOid, pvParamMarshal, pvParam)
    }

    /**
     * A PFN_CRYPT_ASYNC_PARAM_FREE_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_ASYNC_PARAM_FREE_FUNC {
        /**
         * Creates a PFN_CRYPT_ASYNC_PARAM_FREE_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
