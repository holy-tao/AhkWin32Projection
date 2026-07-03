#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }
#Import ".\BCRYPT_SECRET_HANDLE.ahk" { BCRYPT_SECRET_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptSecretAgreementFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptSecretAgreementFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BCRYPT_KEY_HANDLE} hPrivKey 
     * @param {BCRYPT_KEY_HANDLE} hPubKey 
     * @param {Pointer<BCRYPT_SECRET_HANDLE>} phAgreedSecret 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(hPrivKey, hPubKey, phAgreedSecret, dwFlags) {
        result := DllCall(this.value, BCRYPT_KEY_HANDLE, hPrivKey, BCRYPT_KEY_HANDLE, hPubKey, BCRYPT_SECRET_HANDLE.Ptr, phAgreedSecret, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A BCryptSecretAgreementFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptSecretAgreementFn {
        /**
         * Creates a BCryptSecretAgreementFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_KEY_HANDLE, BCRYPT_KEY_HANDLE, BCRYPT_SECRET_HANDLE, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_KEY_HANDLE, BCRYPT_KEY_HANDLE, BCRYPT_SECRET_HANDLE.Ptr, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
