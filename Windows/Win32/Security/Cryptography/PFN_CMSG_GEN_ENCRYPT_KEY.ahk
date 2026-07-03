#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CERT_PUBLIC_KEY_INFO.ahk" { CERT_PUBLIC_KEY_INFO }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CMSG_GEN_ENCRYPT_KEY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CMSG_GEN_ENCRYPT_KEY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer>} phCryptProv 
     * @param {Pointer<CRYPT_ALGORITHM_IDENTIFIER>} paiEncrypt 
     * @param {Pointer<Void>} pvEncryptAuxInfo 
     * @param {Pointer<CERT_PUBLIC_KEY_INFO>} pPublicKeyInfo 
     * @param {Pointer<PFN_CMSG_ALLOC>} _pfnAlloc 
     * @param {Pointer<Pointer>} phEncryptKey 
     * @param {Pointer<Pointer<Integer>>} ppbEncryptParameters 
     * @param {Pointer<Integer>} pcbEncryptParameters 
     * @returns {BOOL} 
     */
    Call(phCryptProv, paiEncrypt, pvEncryptAuxInfo, pPublicKeyInfo, _pfnAlloc, phEncryptKey, ppbEncryptParameters, pcbEncryptParameters) {
        phCryptProvMarshal := phCryptProv is VarRef ? "ptr*" : "ptr"
        pvEncryptAuxInfoMarshal := pvEncryptAuxInfo is VarRef ? "ptr" : "ptr"
        phEncryptKeyMarshal := phEncryptKey is VarRef ? "ptr*" : "ptr"
        ppbEncryptParametersMarshal := ppbEncryptParameters is VarRef ? "ptr*" : "ptr"
        pcbEncryptParametersMarshal := pcbEncryptParameters is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, phCryptProvMarshal, phCryptProv, CRYPT_ALGORITHM_IDENTIFIER.Ptr, paiEncrypt, pvEncryptAuxInfoMarshal, pvEncryptAuxInfo, CERT_PUBLIC_KEY_INFO.Ptr, pPublicKeyInfo, "ptr", _pfnAlloc, phEncryptKeyMarshal, phEncryptKey, ppbEncryptParametersMarshal, ppbEncryptParameters, pcbEncryptParametersMarshal, pcbEncryptParameters, BOOL)
        return result
    }

    /**
     * A PFN_CMSG_GEN_ENCRYPT_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CMSG_GEN_ENCRYPT_KEY {
        /**
         * Creates a PFN_CMSG_GEN_ENCRYPT_KEY pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", CRYPT_ALGORITHM_IDENTIFIER, "ptr", CERT_PUBLIC_KEY_INFO, "ptr", "ptr*", "ptr*", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", CRYPT_ALGORITHM_IDENTIFIER.Ptr, "ptr", CERT_PUBLIC_KEY_INFO.Ptr, "ptr", "ptr*", "ptr*", "uint*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
