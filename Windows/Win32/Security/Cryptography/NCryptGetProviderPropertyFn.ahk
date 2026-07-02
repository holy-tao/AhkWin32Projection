#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptGetProviderPropertyFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptGetProviderPropertyFn) {
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
     * @param {Integer} pbOutput 
     * @param {Integer} cbOutput 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Call(_hProvider, pszProperty, pbOutput, cbOutput, dwFlags) {
        pszProperty := pszProperty is String ? StrPtr(pszProperty) : pszProperty

        result := DllCall(this.value, NCRYPT_PROV_HANDLE, _hProvider, "ptr", pszProperty, IntPtr, pbOutput, UInt32, cbOutput, "uint*", &pcbResult := 0, UInt32, dwFlags, "HRESULT")
        return pcbResult
    }

    /**
     * A NCryptGetProviderPropertyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptGetProviderPropertyFn {
        /**
         * Creates a NCryptGetProviderPropertyFn pointer that invokes the given AHK function when called.
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
