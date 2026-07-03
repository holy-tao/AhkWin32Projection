#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptPromptUserFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptPromptUserFn) {
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
     * @param {PWSTR} pszOperation 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(_hProvider, _hKey, pszOperation, dwFlags) {
        pszOperation := pszOperation is String ? StrPtr(pszOperation) : pszOperation

        result := DllCall(this.value, NCRYPT_PROV_HANDLE, _hProvider, NCRYPT_KEY_HANDLE, _hKey, "ptr", pszOperation, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A NCryptPromptUserFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptPromptUserFn {
        /**
         * Creates a NCryptPromptUserFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, PWSTR, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, PWSTR, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
