#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import ".\NCRYPT_SECRET_HANDLE.ahk" { NCRYPT_SECRET_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptSecretAgreementFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptSecretAgreementFn) {
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
     * @param {NCRYPT_KEY_HANDLE} hPrivKey 
     * @param {NCRYPT_KEY_HANDLE} hPubKey 
     * @param {Integer} dwFlags 
     * @returns {NCRYPT_SECRET_HANDLE} 
     */
    Call(_hProvider, hPrivKey, hPubKey, dwFlags) {
        phAgreedSecret := NCRYPT_SECRET_HANDLE()
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, _hProvider, NCRYPT_KEY_HANDLE, hPrivKey, NCRYPT_KEY_HANDLE, hPubKey, NCRYPT_SECRET_HANDLE.Ptr, phAgreedSecret, UInt32, dwFlags, "HRESULT")
        return phAgreedSecret
    }

    /**
     * A NCryptSecretAgreementFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptSecretAgreementFn {
        /**
         * Creates a NCryptSecretAgreementFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, NCRYPT_KEY_HANDLE, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
