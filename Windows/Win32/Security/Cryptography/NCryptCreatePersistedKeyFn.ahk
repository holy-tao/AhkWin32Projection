#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptCreatePersistedKeyFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptCreatePersistedKeyFn) {
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
     * @param {PWSTR} pszAlgId 
     * @param {PWSTR} pszKeyName 
     * @param {Integer} dwLegacyKeySpec 
     * @param {Integer} dwFlags 
     * @returns {NCRYPT_KEY_HANDLE} 
     */
    Call(_hProvider, pszAlgId, pszKeyName, dwLegacyKeySpec, dwFlags) {
        pszAlgId := pszAlgId is String ? StrPtr(pszAlgId) : pszAlgId
        pszKeyName := pszKeyName is String ? StrPtr(pszKeyName) : pszKeyName

        phKey := NCRYPT_KEY_HANDLE.Owned()
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, _hProvider, NCRYPT_KEY_HANDLE.Ptr, phKey, "ptr", pszAlgId, "ptr", pszKeyName, UInt32, dwLegacyKeySpec, UInt32, dwFlags, "HRESULT")
        return phKey
    }

    /**
     * A NCryptCreatePersistedKeyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptCreatePersistedKeyFn {
        /**
         * Creates a NCryptCreatePersistedKeyFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, PWSTR, PWSTR, UInt32, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, PWSTR, PWSTR, UInt32, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
