#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\BCryptBufferDesc.ahk" { BCryptBufferDesc }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptVerifyClaimFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptVerifyClaimFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {NCRYPT_PROV_HANDLE} hProv 
     * @param {NCRYPT_KEY_HANDLE} hSubjectKey 
     * @param {NCRYPT_KEY_HANDLE} hAuthorityKey 
     * @param {Integer} dwClaimType 
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
     * @param {Integer} pbClaimBlob 
     * @param {Integer} cbClaimBlob 
     * @param {Pointer<BCryptBufferDesc>} pOutput 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(hProv, hSubjectKey, hAuthorityKey, dwClaimType, pParameterList, pbClaimBlob, cbClaimBlob, pOutput, dwFlags) {
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hProv, NCRYPT_KEY_HANDLE, hSubjectKey, NCRYPT_KEY_HANDLE, hAuthorityKey, UInt32, dwClaimType, BCryptBufferDesc.Ptr, pParameterList, IntPtr, pbClaimBlob, UInt32, cbClaimBlob, BCryptBufferDesc.Ptr, pOutput, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A NCryptVerifyClaimFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptVerifyClaimFn {
        /**
         * Creates a NCryptVerifyClaimFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, UInt32, BCryptBufferDesc, IntPtr, UInt32, BCryptBufferDesc, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, UInt32, BCryptBufferDesc.Ptr, IntPtr, UInt32, BCryptBufferDesc.Ptr, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
