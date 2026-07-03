#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_OBJECT_LOCATOR_RELEASE_REASON.ahk" { CRYPT_OBJECT_LOCATOR_RELEASE_REASON }

/**
 * Releases the provider.
 * @remarks
 * The <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_RELEASE</b> callback function is currently called by only the Secure Channel (Schannel) security package. This function is called once for every call made to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_initialize">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_INITIALIZE</a>.
 * 
 * The provider is not expected to release all memory for all objects but should clean itself if the <i>dwReason</i> parameter is set to <b>CRYPT_OBJECT_LOCATOR_RELEASE_SERVICE_STOP</b> or <b>CRYPT_OBJECT_LOCATOR_RELEASE_DLL_UNLOAD</b>.
 * 
 * This function must block so that  calls to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_flush">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FLUSH</a> can complete.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_release
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_RELEASE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_RELEASE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {CRYPT_OBJECT_LOCATOR_RELEASE_REASON} dwReason 
     * @param {Pointer<Void>} pPluginContext Pointer to an optional buffer defined by this provider and returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_initialize">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_INITIALIZE</a> function. The buffer is not modified by the caller. Your provider can use the data to help it determine what actions to perform or to maintain additional information.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(dwReason, pPluginContext) {
        pPluginContextMarshal := pPluginContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, CRYPT_OBJECT_LOCATOR_RELEASE_REASON, dwReason, pPluginContextMarshal, pPluginContext)
    }

    /**
     * A PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_RELEASE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_RELEASE {
        /**
         * Creates a PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_RELEASE pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_OBJECT_LOCATOR_RELEASE_REASON, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_OBJECT_LOCATOR_RELEASE_REASON, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
