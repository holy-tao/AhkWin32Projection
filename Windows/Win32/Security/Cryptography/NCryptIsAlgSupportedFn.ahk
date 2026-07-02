#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptIsAlgSupportedFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptIsAlgSupportedFn) {
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
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(_hProvider, pszAlgId, dwFlags) {
        pszAlgId := pszAlgId is String ? StrPtr(pszAlgId) : pszAlgId

        result := DllCall(this.value, NCRYPT_PROV_HANDLE, _hProvider, "ptr", pszAlgId, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A NCryptIsAlgSupportedFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptIsAlgSupportedFn {
        /**
         * Creates a NCryptIsAlgSupportedFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, PWSTR, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, PWSTR, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
