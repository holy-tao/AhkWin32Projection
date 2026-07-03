#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import ".\NCRYPT_SSL_CIPHER_SUITE.ahk" { NCRYPT_SSL_CIPHER_SUITE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslLookupCipherSuiteInfoFn {
    value : IntPtr

    __value {
        set {
            if (value is SslLookupCipherSuiteInfoFn) {
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
     * @param {Integer} dwKeyType 
     * @param {Pointer<NCRYPT_SSL_CIPHER_SUITE>} pCipherSuite 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(hSslProvider, dwProtocol, dwCipherSuite, dwKeyType, pCipherSuite, dwFlags) {
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, UInt32, dwProtocol, UInt32, dwCipherSuite, UInt32, dwKeyType, NCRYPT_SSL_CIPHER_SUITE.Ptr, pCipherSuite, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A SslLookupCipherSuiteInfoFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslLookupCipherSuiteInfoFn {
        /**
         * Creates a SslLookupCipherSuiteInfoFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, UInt32, UInt32, UInt32, NCRYPT_SSL_CIPHER_SUITE, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, UInt32, UInt32, UInt32, NCRYPT_SSL_CIPHER_SUITE.Ptr, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
