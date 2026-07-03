#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_ASYNC_RETRIEVAL_COMPLETION_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_ASYNC_RETRIEVAL_COMPLETION_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvCompletion 
     * @param {Integer} dwCompletionCode 
     * @param {PSTR} pszUrl 
     * @param {PSTR} pszObjectOid 
     * @param {Pointer<Void>} pvObject 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pvCompletion, dwCompletionCode, pszUrl, pszObjectOid, pvObject) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl
        pszObjectOid := pszObjectOid is String ? StrPtr(pszObjectOid) : pszObjectOid

        pvCompletionMarshal := pvCompletion is VarRef ? "ptr" : "ptr"
        pvObjectMarshal := pvObject is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pvCompletionMarshal, pvCompletion, UInt32, dwCompletionCode, "ptr", pszUrl, "ptr", pszObjectOid, pvObjectMarshal, pvObject)
    }

    /**
     * A PFN_CRYPT_ASYNC_RETRIEVAL_COMPLETION_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_ASYNC_RETRIEVAL_COMPLETION_FUNC {
        /**
         * Creates a PFN_CRYPT_ASYNC_RETRIEVAL_COMPLETION_FUNC pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, PSTR, PSTR, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, PSTR, PSTR, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
