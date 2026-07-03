#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import ".\NCRYPT_SSL_CIPHER_SUITE_EX.ahk" { NCRYPT_SSL_CIPHER_SUITE_EX }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslEnumCipherSuitesExFn {
    value : IntPtr

    __value {
        set {
            if (value is SslEnumCipherSuitesExFn) {
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
     * @param {Pointer<Pointer<Void>>} ppEnumState 
     * @param {Integer} dwFlags 
     * @returns {Pointer<NCRYPT_SSL_CIPHER_SUITE_EX>} 
     */
    Call(hSslProvider, hPrivateKey, ppEnumState, dwFlags) {
        ppEnumStateMarshal := ppEnumState is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, NCRYPT_KEY_HANDLE, hPrivateKey, "ptr*", &ppCipherSuite := 0, ppEnumStateMarshal, ppEnumState, UInt32, dwFlags, "HRESULT")
        return ppCipherSuite
    }

    /**
     * A SslEnumCipherSuitesExFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslEnumCipherSuitesExFn {
        /**
         * Creates a SslEnumCipherSuitesExFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, "ptr*", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, "ptr*", UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
