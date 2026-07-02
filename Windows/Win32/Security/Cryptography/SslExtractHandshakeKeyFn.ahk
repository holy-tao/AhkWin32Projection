#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\BCryptBufferDesc.ahk" { BCryptBufferDesc }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslExtractHandshakeKeyFn {
    value : IntPtr

    __value {
        set {
            if (value is SslExtractHandshakeKeyFn) {
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
     * @param {NCRYPT_KEY_HANDLE} hPrivateKey 
     * @param {NCRYPT_KEY_HANDLE} hPublicKey 
     * @param {NCRYPT_KEY_HANDLE} hEarlyKey 
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
     * @param {Integer} dwFlags 
     * @returns {NCRYPT_KEY_HANDLE} 
     */
    Call(hSslProvider, hPrivateKey, hPublicKey, hEarlyKey, pParameterList, dwFlags) {
        phHandshakeKey := NCRYPT_KEY_HANDLE.Owned()
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, NCRYPT_KEY_HANDLE, hPrivateKey, NCRYPT_KEY_HANDLE, hPublicKey, NCRYPT_KEY_HANDLE, hEarlyKey, NCRYPT_KEY_HANDLE.Ptr, phHandshakeKey, BCryptBufferDesc.Ptr, pParameterList, UInt32, dwFlags, "HRESULT")
        return phHandshakeKey
    }

    /**
     * A SslExtractHandshakeKeyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslExtractHandshakeKeyFn {
        /**
         * Creates a SslExtractHandshakeKeyFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, BCryptBufferDesc, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, BCryptBufferDesc.Ptr, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
