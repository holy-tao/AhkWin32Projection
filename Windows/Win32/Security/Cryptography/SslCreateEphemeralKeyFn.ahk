#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslCreateEphemeralKeyFn {
    value : IntPtr

    __value {
        set {
            if (value is SslCreateEphemeralKeyFn) {
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
     * @param {Integer} dwKeyBitLen 
     * @param {Integer} pbParams 
     * @param {Integer} cbParams 
     * @param {Integer} dwFlags 
     * @returns {NCRYPT_KEY_HANDLE} 
     */
    Call(hSslProvider, dwProtocol, dwCipherSuite, dwKeyType, dwKeyBitLen, pbParams, cbParams, dwFlags) {
        phEphemeralKey := NCRYPT_KEY_HANDLE.Owned()
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, NCRYPT_KEY_HANDLE.Ptr, phEphemeralKey, UInt32, dwProtocol, UInt32, dwCipherSuite, UInt32, dwKeyType, UInt32, dwKeyBitLen, IntPtr, pbParams, UInt32, cbParams, UInt32, dwFlags, "HRESULT")
        return phEphemeralKey
    }

    /**
     * A SslCreateEphemeralKeyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslCreateEphemeralKeyFn {
        /**
         * Creates a SslCreateEphemeralKeyFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, UInt32, UInt32, UInt32, UInt32, IntPtr, UInt32, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, UInt32, UInt32, UInt32, UInt32, IntPtr, UInt32, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
