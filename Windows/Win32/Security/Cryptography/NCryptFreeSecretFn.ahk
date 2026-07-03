#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import ".\NCRYPT_SECRET_HANDLE.ahk" { NCRYPT_SECRET_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptFreeSecretFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptFreeSecretFn) {
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
     * @returns {HRESULT} 
     */
    Call(_hProvider, hSharedSecret) {
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, _hProvider, NCRYPT_SECRET_HANDLE, hSharedSecret, "HRESULT")
        return result
    }

    /**
     * A NCryptFreeSecretFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptFreeSecretFn {
        /**
         * Creates a NCryptFreeSecretFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_SECRET_HANDLE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_SECRET_HANDLE, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
