#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptFreeProviderFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptFreeProviderFn) {
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
     * @returns {HRESULT} 
     */
    Call(_hProvider) {
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, _hProvider, "HRESULT")
        return result
    }

    /**
     * A NCryptFreeProviderFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptFreeProviderFn {
        /**
         * Creates a NCryptFreeProviderFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
