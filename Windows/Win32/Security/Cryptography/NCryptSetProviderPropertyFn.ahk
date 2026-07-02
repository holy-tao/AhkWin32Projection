#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptSetProviderPropertyFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptSetProviderPropertyFn) {
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
     * @param {PWSTR} pszProperty 
     * @param {Integer} pbInput 
     * @param {Integer} cbInput 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(_hProvider, pszProperty, pbInput, cbInput, dwFlags) {
        pszProperty := pszProperty is String ? StrPtr(pszProperty) : pszProperty

        result := DllCall(this.value, NCRYPT_PROV_HANDLE, _hProvider, "ptr", pszProperty, IntPtr, pbInput, UInt32, cbInput, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A NCryptSetProviderPropertyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptSetProviderPropertyFn {
        /**
         * Creates a NCryptSetProviderPropertyFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, PWSTR, IntPtr, UInt32, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, PWSTR, IntPtr, UInt32, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
