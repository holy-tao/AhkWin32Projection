#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Releases memory for an object identifier.
 * @remarks
 * The <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER</b> function is currently called by only the Secure Channel (Schannel) security package. This function may be called for any of the following reasons:
 * 
 * <ul>
 * <li>An error occurred when processing the object returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_get">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET</a> function.</li>
 * <li>The object returned by <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_get">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET</a> is no longer needed.</li>
 * <li>An updated object has been retrieved and the original object is no longer required.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free_identifier
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER) {
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
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pIdentifier Pointer to the buffer that contains the identifier.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pPluginContext, pIdentifier) {
        pPluginContextMarshal := pPluginContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pPluginContextMarshal, pPluginContext, CRYPT_INTEGER_BLOB.Ptr, pIdentifier)
    }

    /**
     * A PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER {
        /**
         * Creates a PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", CRYPT_INTEGER_BLOB) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", CRYPT_INTEGER_BLOB.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
