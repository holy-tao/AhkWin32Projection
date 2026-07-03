#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\BCryptBufferDesc.ahk" { BCryptBufferDesc }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslImportMasterKeyFn {
    value : IntPtr

    __value {
        set {
            if (value is SslImportMasterKeyFn) {
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
     * @param {Integer} dwProtocol 
     * @param {Integer} dwCipherSuite 
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
     * @param {Integer} pbEncryptedKey 
     * @param {Integer} cbEncryptedKey 
     * @param {Integer} dwFlags 
     * @returns {NCRYPT_KEY_HANDLE} 
     */
    Call(hSslProvider, hPrivateKey, dwProtocol, dwCipherSuite, pParameterList, pbEncryptedKey, cbEncryptedKey, dwFlags) {
        phMasterKey := NCRYPT_KEY_HANDLE.Owned()
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, NCRYPT_KEY_HANDLE, hPrivateKey, NCRYPT_KEY_HANDLE.Ptr, phMasterKey, UInt32, dwProtocol, UInt32, dwCipherSuite, BCryptBufferDesc.Ptr, pParameterList, IntPtr, pbEncryptedKey, UInt32, cbEncryptedKey, UInt32, dwFlags, "HRESULT")
        return phMasterKey
    }

    /**
     * A SslImportMasterKeyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslImportMasterKeyFn {
        /**
         * Creates a SslImportMasterKeyFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, UInt32, UInt32, BCryptBufferDesc, IntPtr, UInt32, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, UInt32, UInt32, BCryptBufferDesc.Ptr, IntPtr, UInt32, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
