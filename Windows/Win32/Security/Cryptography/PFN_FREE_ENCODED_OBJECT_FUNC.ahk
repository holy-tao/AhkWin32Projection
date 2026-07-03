#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CRYPT_BLOB_ARRAY.ahk" { CRYPT_BLOB_ARRAY }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_FREE_ENCODED_OBJECT_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_FREE_ENCODED_OBJECT_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} pszObjectOid 
     * @param {Pointer<CRYPT_BLOB_ARRAY>} pObject 
     * @param {Pointer<Void>} pvFreeContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pszObjectOid, pObject, pvFreeContext) {
        pszObjectOid := pszObjectOid is String ? StrPtr(pszObjectOid) : pszObjectOid

        pvFreeContextMarshal := pvFreeContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, "ptr", pszObjectOid, CRYPT_BLOB_ARRAY.Ptr, pObject, pvFreeContextMarshal, pvFreeContext)
    }

    /**
     * A PFN_FREE_ENCODED_OBJECT_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_FREE_ENCODED_OBJECT_FUNC {
        /**
         * Creates a PFN_FREE_ENCODED_OBJECT_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, CRYPT_BLOB_ARRAY, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, CRYPT_BLOB_ARRAY.Ptr, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
