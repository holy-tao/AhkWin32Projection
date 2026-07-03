#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\BCryptBufferDesc.ahk" { BCryptBufferDesc }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslGenerateSessionKeysFn {
    value : IntPtr

    __value {
        set {
            if (value is SslGenerateSessionKeysFn) {
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
     * @param {NCRYPT_KEY_HANDLE} hMasterKey 
     * @param {Pointer<NCRYPT_KEY_HANDLE>} phReadKey 
     * @param {Pointer<NCRYPT_KEY_HANDLE>} phWriteKey 
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(hSslProvider, hMasterKey, phReadKey, phWriteKey, pParameterList, dwFlags) {
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, NCRYPT_KEY_HANDLE, hMasterKey, NCRYPT_KEY_HANDLE.Ptr, phReadKey, NCRYPT_KEY_HANDLE.Ptr, phWriteKey, BCryptBufferDesc.Ptr, pParameterList, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A SslGenerateSessionKeysFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslGenerateSessionKeysFn {
        /**
         * Creates a SslGenerateSessionKeysFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, BCryptBufferDesc, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE.Ptr, NCRYPT_KEY_HANDLE.Ptr, BCryptBufferDesc.Ptr, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
