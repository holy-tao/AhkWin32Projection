#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import ".\NCRYPT_HASH_HANDLE.ahk" { NCRYPT_HASH_HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslCreateHandshakeHashFn {
    value : IntPtr

    __value {
        set {
            if (value is SslCreateHandshakeHashFn) {
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
     * @param {Integer} dwFlags 
     * @returns {NCRYPT_HASH_HANDLE} 
     */
    Call(hSslProvider, dwProtocol, dwCipherSuite, dwFlags) {
        phHandshakeHash := NCRYPT_HASH_HANDLE()
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, NCRYPT_HASH_HANDLE.Ptr, phHandshakeHash, UInt32, dwProtocol, UInt32, dwCipherSuite, UInt32, dwFlags, "HRESULT")
        return phHandshakeHash
    }

    /**
     * A SslCreateHandshakeHashFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslCreateHandshakeHashFn {
        /**
         * Creates a SslCreateHandshakeHashFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, UInt32, UInt32, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, UInt32, UInt32, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
