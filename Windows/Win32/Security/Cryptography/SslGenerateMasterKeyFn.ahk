#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\BCryptBufferDesc.ahk" { BCryptBufferDesc }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslGenerateMasterKeyFn {
    value : IntPtr

    __value {
        set {
            if (value is SslGenerateMasterKeyFn) {
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
     * @param {Pointer<NCRYPT_KEY_HANDLE>} phMasterKey 
     * @param {Integer} dwProtocol 
     * @param {Integer} dwCipherSuite 
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
     * @param {Integer} pbOutput 
     * @param {Integer} cbOutput 
     * @param {Pointer<Integer>} pcbResult 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(hSslProvider, hPrivateKey, hPublicKey, phMasterKey, dwProtocol, dwCipherSuite, pParameterList, pbOutput, cbOutput, pcbResult, dwFlags) {
        pcbResultMarshal := pcbResult is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, NCRYPT_KEY_HANDLE, hPrivateKey, NCRYPT_KEY_HANDLE, hPublicKey, NCRYPT_KEY_HANDLE.Ptr, phMasterKey, UInt32, dwProtocol, UInt32, dwCipherSuite, BCryptBufferDesc.Ptr, pParameterList, IntPtr, pbOutput, UInt32, cbOutput, pcbResultMarshal, pcbResult, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A SslGenerateMasterKeyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslGenerateMasterKeyFn {
        /**
         * Creates a SslGenerateMasterKeyFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, UInt32, UInt32, BCryptBufferDesc, IntPtr, UInt32, "uint*", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 11)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 11 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE.Ptr, UInt32, UInt32, BCryptBufferDesc.Ptr, IntPtr, UInt32, "uint*", UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
