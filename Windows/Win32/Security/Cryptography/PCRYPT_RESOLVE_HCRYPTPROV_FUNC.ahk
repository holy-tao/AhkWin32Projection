#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPT_PRIVATE_KEY_INFO.ahk" { CRYPT_PRIVATE_KEY_INFO }

/**
 * Returns a handle to a cryptographic service provider (CSP) by using the phCryptProv parameter to receive the key being imported.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pcrypt_resolve_hcryptprov_func
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PCRYPT_RESOLVE_HCRYPTPROV_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PCRYPT_RESOLVE_HCRYPTPROV_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CRYPT_PRIVATE_KEY_INFO>} pPrivateKeyInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_private_key_info">CRYPT_PRIVATE_KEY_INFO</a> structure that describes the key being imported.
     * @param {Pointer<Pointer>} phCryptProv A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/hcryptprov">HCRYPTPROV</a>   to receive the CSP.
     * @param {Pointer<Void>} pVoidResolveFunc The <b>pVoidResolveFunc</b> member passed in by the caller in the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_pkcs8_import_params">CRYPT_PKCS8_IMPORT_PARAMS</a>  structure.
     * @returns {BOOL} If the function succeeds, the function returns nonzero (<b>TRUE</b>).
     * 
     * If the function fails, it returns zero (<b>FALSE</b>).
     */
    Call(pPrivateKeyInfo, phCryptProv, pVoidResolveFunc) {
        phCryptProvMarshal := phCryptProv is VarRef ? "ptr*" : "ptr"
        pVoidResolveFuncMarshal := pVoidResolveFunc is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CRYPT_PRIVATE_KEY_INFO.Ptr, pPrivateKeyInfo, phCryptProvMarshal, phCryptProv, pVoidResolveFuncMarshal, pVoidResolveFunc, BOOL)
        return result
    }

    /**
     * A PCRYPT_RESOLVE_HCRYPTPROV_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCRYPT_RESOLVE_HCRYPTPROV_FUNC {
        /**
         * Creates a PCRYPT_RESOLVE_HCRYPTPROV_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_PRIVATE_KEY_INFO, "ptr*", "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_PRIVATE_KEY_INFO.Ptr, "ptr*", "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
