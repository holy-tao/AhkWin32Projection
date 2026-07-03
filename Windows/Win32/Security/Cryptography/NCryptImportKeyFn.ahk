#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BCryptBufferDesc.ahk" { BCryptBufferDesc }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptImportKeyFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptImportKeyFn) {
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
     * @param {NCRYPT_KEY_HANDLE} hImportKey 
     * @param {PWSTR} pszBlobType 
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
     * @param {Integer} pbData 
     * @param {Integer} cbData 
     * @param {Integer} dwFlags 
     * @returns {NCRYPT_KEY_HANDLE} 
     */
    Call(_hProvider, hImportKey, pszBlobType, pParameterList, pbData, cbData, dwFlags) {
        pszBlobType := pszBlobType is String ? StrPtr(pszBlobType) : pszBlobType

        phKey := NCRYPT_KEY_HANDLE.Owned()
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, _hProvider, NCRYPT_KEY_HANDLE, hImportKey, "ptr", pszBlobType, BCryptBufferDesc.Ptr, pParameterList, NCRYPT_KEY_HANDLE.Ptr, phKey, IntPtr, pbData, UInt32, cbData, UInt32, dwFlags, "HRESULT")
        return phKey
    }

    /**
     * A NCryptImportKeyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptImportKeyFn {
        /**
         * Creates a NCryptImportKeyFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, PWSTR, BCryptBufferDesc, IntPtr, UInt32, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, PWSTR, BCryptBufferDesc.Ptr, IntPtr, UInt32, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
