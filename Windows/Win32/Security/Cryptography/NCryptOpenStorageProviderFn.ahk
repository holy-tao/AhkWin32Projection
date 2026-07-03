#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptOpenStorageProviderFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptOpenStorageProviderFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pszProviderName 
     * @param {Integer} dwFlags 
     * @returns {NCRYPT_PROV_HANDLE} 
     */
    Call(pszProviderName, dwFlags) {
        pszProviderName := pszProviderName is String ? StrPtr(pszProviderName) : pszProviderName

        phProvider := NCRYPT_PROV_HANDLE.Owned()
        result := DllCall(this.value, NCRYPT_PROV_HANDLE.Ptr, phProvider, "ptr", pszProviderName, UInt32, dwFlags, "HRESULT")
        return phProvider
    }

    /**
     * A NCryptOpenStorageProviderFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptOpenStorageProviderFn {
        /**
         * Creates a NCryptOpenStorageProviderFn pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
