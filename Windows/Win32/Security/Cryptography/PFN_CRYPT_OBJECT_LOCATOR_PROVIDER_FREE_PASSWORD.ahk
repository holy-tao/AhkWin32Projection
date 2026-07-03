#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Releases the password used to encrypt a personal information exchange (PFX) byte array.
 * @remarks
 * The <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD</b> function is currently called by only the Secure Channel (Schannel) security package. Schannel calls <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_get">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET</a> to retrieve a PFX byte array and then calls <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD</b> after the byte array has been processed but before calling the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free_identifier">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free_password
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pPluginContext Pointer to an optional buffer defined by this provider and returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_initialize">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_INITIALIZE</a> function. The buffer is not modified by the caller. Your provider can use the data to help it determine what actions to perform or to maintain additional information.
     * @param {PWSTR} pwszPassword Null-terminated Unicode string that contains the password.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pPluginContext, pwszPassword) {
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword

        pPluginContextMarshal := pPluginContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pPluginContextMarshal, pPluginContext, "ptr", pwszPassword)
    }

    /**
     * A PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD {
        /**
         * Creates a PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PWSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PWSTR, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
