#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BCryptBufferDesc.ahk" { BCryptBufferDesc }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptExportKeyFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptExportKeyFn) {
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
     * @param {NCRYPT_KEY_HANDLE} _hKey 
     * @param {NCRYPT_KEY_HANDLE} hExportKey 
     * @param {PWSTR} pszBlobType 
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
     * @param {Integer} pbOutput 
     * @param {Integer} cbOutput 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Call(_hProvider, _hKey, hExportKey, pszBlobType, pParameterList, pbOutput, cbOutput, dwFlags) {
        pszBlobType := pszBlobType is String ? StrPtr(pszBlobType) : pszBlobType

        result := DllCall(this.value, NCRYPT_PROV_HANDLE, _hProvider, NCRYPT_KEY_HANDLE, _hKey, NCRYPT_KEY_HANDLE, hExportKey, "ptr", pszBlobType, BCryptBufferDesc.Ptr, pParameterList, IntPtr, pbOutput, UInt32, cbOutput, "uint*", &pcbResult := 0, UInt32, dwFlags, "HRESULT")
        return pcbResult
    }

    /**
     * A NCryptExportKeyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptExportKeyFn {
        /**
         * Creates a NCryptExportKeyFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, PWSTR, BCryptBufferDesc, IntPtr, UInt32, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, PWSTR, BCryptBufferDesc.Ptr, IntPtr, UInt32, UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
