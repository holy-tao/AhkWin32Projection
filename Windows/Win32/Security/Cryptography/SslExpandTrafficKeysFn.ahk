#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import ".\NCRYPT_HASH_HANDLE.ahk" { NCRYPT_HASH_HANDLE }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\BCryptBufferDesc.ahk" { BCryptBufferDesc }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslExpandTrafficKeysFn {
    value : IntPtr

    __value {
        set {
            if (value is SslExpandTrafficKeysFn) {
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
     * @param {NCRYPT_KEY_HANDLE} hBaseKey 
     * @param {NCRYPT_HASH_HANDLE} hHashValue 
     * @param {Pointer<NCRYPT_KEY_HANDLE>} phClientTrafficKey 
     * @param {Pointer<NCRYPT_KEY_HANDLE>} phServerTrafficKey 
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(hSslProvider, hBaseKey, hHashValue, phClientTrafficKey, phServerTrafficKey, pParameterList, dwFlags) {
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, NCRYPT_KEY_HANDLE, hBaseKey, NCRYPT_HASH_HANDLE, hHashValue, NCRYPT_KEY_HANDLE.Ptr, phClientTrafficKey, NCRYPT_KEY_HANDLE.Ptr, phServerTrafficKey, BCryptBufferDesc.Ptr, pParameterList, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A SslExpandTrafficKeysFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslExpandTrafficKeysFn {
        /**
         * Creates a SslExpandTrafficKeysFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_HASH_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, BCryptBufferDesc, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_HASH_HANDLE, NCRYPT_KEY_HANDLE.Ptr, NCRYPT_KEY_HANDLE.Ptr, BCryptBufferDesc.Ptr, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
