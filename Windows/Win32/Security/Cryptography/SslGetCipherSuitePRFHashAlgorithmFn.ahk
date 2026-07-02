#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslGetCipherSuitePRFHashAlgorithmFn {
    value : IntPtr

    __value {
        set {
            if (value is SslGetCipherSuitePRFHashAlgorithmFn) {
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
     * @param {PWSTR} szPRFHash 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(hSslProvider, dwProtocol, dwCipherSuite, dwKeyType, szPRFHash, dwFlags) {
        szPRFHash := szPRFHash is String ? StrPtr(szPRFHash) : szPRFHash

        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, UInt32, dwProtocol, UInt32, dwCipherSuite, UInt32, dwKeyType, "ptr", szPRFHash, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A SslGetCipherSuitePRFHashAlgorithmFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslGetCipherSuitePRFHashAlgorithmFn {
        /**
         * Creates a SslGetCipherSuitePRFHashAlgorithmFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, UInt32, UInt32, UInt32, PWSTR, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, UInt32, UInt32, UInt32, PWSTR, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
