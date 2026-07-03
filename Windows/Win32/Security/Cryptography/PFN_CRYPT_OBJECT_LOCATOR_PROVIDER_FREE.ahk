#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Releases the object returned by the provider.
 * @remarks
 * The <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE</b> function is currently called by only the Secure Channel (Schannel) security package. Schannel calls <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_get">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET</a> to retrieve an object and then calls <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE</b> to remove the data returned by the <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET</b> call from memory when it is no longer required.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE) {
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
     * @param {Pointer<Integer>} pbData Pointer to the buffer to release.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pPluginContext, pbData) {
        pPluginContextMarshal := pPluginContext is VarRef ? "ptr" : "ptr"
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

        DllCall(this.value, pPluginContextMarshal, pPluginContext, pbDataMarshal, pbData)
    }

    /**
     * A PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE {
        /**
         * Creates a PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "char*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "char*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
