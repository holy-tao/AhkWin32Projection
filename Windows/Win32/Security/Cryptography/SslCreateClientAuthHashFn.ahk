#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NCRYPT_HASH_HANDLE.ahk" { NCRYPT_HASH_HANDLE }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslCreateClientAuthHashFn {
    value : IntPtr

    __value {
        set {
            if (value is SslCreateClientAuthHashFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {NCRYPT_PROV_HANDLE} hSslProvider 
     * @param {Integer} dwProtocol 
     * @param {Integer} dwCipherSuite 
     * @param {PWSTR} pszHashAlgId 
     * @param {Integer} dwFlags 
     * @returns {NCRYPT_HASH_HANDLE} 
     */
    Call(hSslProvider, dwProtocol, dwCipherSuite, pszHashAlgId, dwFlags) {
        pszHashAlgId := pszHashAlgId is String ? StrPtr(pszHashAlgId) : pszHashAlgId

        phHandshakeHash := NCRYPT_HASH_HANDLE()
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, NCRYPT_HASH_HANDLE.Ptr, phHandshakeHash, UInt32, dwProtocol, UInt32, dwCipherSuite, "ptr", pszHashAlgId, UInt32, dwFlags, "HRESULT")
        return phHandshakeHash
    }

    /**
     * A SslCreateClientAuthHashFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslCreateClientAuthHashFn {
        /**
         * Creates a SslCreateClientAuthHashFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, UInt32, UInt32, PWSTR, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, UInt32, UInt32, PWSTR, UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
