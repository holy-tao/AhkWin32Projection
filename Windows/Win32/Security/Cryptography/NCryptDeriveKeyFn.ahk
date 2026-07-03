#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BCryptBufferDesc.ahk" { BCryptBufferDesc }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import ".\NCRYPT_SECRET_HANDLE.ahk" { NCRYPT_SECRET_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptDeriveKeyFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptDeriveKeyFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {NCRYPT_PROV_HANDLE} _hProvider 
     * @param {NCRYPT_SECRET_HANDLE} hSharedSecret 
     * @param {PWSTR} pwszKDF 
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
     * @param {Integer} pbDerivedKey 
     * @param {Integer} cbDerivedKey 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Call(_hProvider, hSharedSecret, pwszKDF, pParameterList, pbDerivedKey, cbDerivedKey, dwFlags) {
        pwszKDF := pwszKDF is String ? StrPtr(pwszKDF) : pwszKDF

        result := DllCall(this.value, NCRYPT_PROV_HANDLE, _hProvider, NCRYPT_SECRET_HANDLE, hSharedSecret, "ptr", pwszKDF, BCryptBufferDesc.Ptr, pParameterList, IntPtr, pbDerivedKey, UInt32, cbDerivedKey, "uint*", &pcbResult := 0, UInt32, dwFlags, "HRESULT")
        return pcbResult
    }

    /**
     * A NCryptDeriveKeyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptDeriveKeyFn {
        /**
         * Creates a NCryptDeriveKeyFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_SECRET_HANDLE, PWSTR, BCryptBufferDesc, IntPtr, UInt32, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_SECRET_HANDLE, PWSTR, BCryptBufferDesc.Ptr, IntPtr, UInt32, UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
