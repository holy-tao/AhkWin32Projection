#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }
#Import ".\CERT_QUERY_ENCODING_TYPE.ahk" { CERT_QUERY_ENCODING_TYPE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_EXPORT_PUBLIC_KEY_INFO_FROM_BCRYPT_HANDLE_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_EXPORT_PUBLIC_KEY_INFO_FROM_BCRYPT_HANDLE_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BCRYPT_KEY_HANDLE} hBCryptKey 
     * @param {CERT_QUERY_ENCODING_TYPE} dwCertEncodingType 
     * @param {PSTR} pszPublicKeyObjId 
     * @param {Integer} dwFlags 
     * @param {Pointer<Void>} pvAuxInfo 
     * @param {Integer} pInfo 
     * @param {Pointer<Integer>} pcbInfo 
     * @returns {BOOL} 
     */
    Call(hBCryptKey, dwCertEncodingType, pszPublicKeyObjId, dwFlags, pvAuxInfo, pInfo, pcbInfo) {
        pszPublicKeyObjId := pszPublicKeyObjId is String ? StrPtr(pszPublicKeyObjId) : pszPublicKeyObjId

        pvAuxInfoMarshal := pvAuxInfo is VarRef ? "ptr" : "ptr"
        pcbInfoMarshal := pcbInfo is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, BCRYPT_KEY_HANDLE, hBCryptKey, CERT_QUERY_ENCODING_TYPE, dwCertEncodingType, "ptr", pszPublicKeyObjId, UInt32, dwFlags, pvAuxInfoMarshal, pvAuxInfo, IntPtr, pInfo, pcbInfoMarshal, pcbInfo, BOOL)
        return result
    }

    /**
     * A PFN_CRYPT_EXPORT_PUBLIC_KEY_INFO_FROM_BCRYPT_HANDLE_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_EXPORT_PUBLIC_KEY_INFO_FROM_BCRYPT_HANDLE_FUNC {
        /**
         * Creates a PFN_CRYPT_EXPORT_PUBLIC_KEY_INFO_FROM_BCRYPT_HANDLE_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_KEY_HANDLE, CERT_QUERY_ENCODING_TYPE, PSTR, UInt32, "ptr", IntPtr, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_KEY_HANDLE, CERT_QUERY_ENCODING_TYPE, PSTR, UInt32, "ptr", IntPtr, "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
