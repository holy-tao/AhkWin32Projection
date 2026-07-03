#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPT_OBJECT_LOCATOR_PROVIDER_TABLE.ahk" { CRYPT_OBJECT_LOCATOR_PROVIDER_TABLE }

/**
 * Initializes the provider.
 * @remarks
 * The <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_INITIALIZE</b> function is currently called by only the Secure Channel (Schannel) security service provider (SSP). The Cryptography API (CAPI) will internally call your custom provider if, beginning with Windows 8, you specify the name of the security principal in the <i>pszPrincipal</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle</a> function.
 * 
 * When you implement this function, remember to fill the  <a href="https://docs.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_object_locator_provider_table">CRYPT_OBJECT_LOCATOR_PROVIDER_TABLE</a> function table with pointers to the following functions implemented by your provider:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_get">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_release">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_RELEASE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free_password">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free_identifier">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER</a>
 * </li>
 * </ul>
 * You must call <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptregisterdefaultoidfunction">CryptRegisterDefaultOIDFunction</a> to register the provider in the Windows registry.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_initialize
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_INITIALIZE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_INITIALIZE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FLUSH>} pfnFlush Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_flush">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FLUSH</a> function implementation.
     * @param {Pointer<Void>} pContext Pointer to a provider defined object that contains information about the provider and the objects.
     * @param {Pointer<Integer>} pdwExpectedObjectCount Specifies the number of unique objects that the provider expects to locate. This value tells the caller how much memory to allocate for storing objects. Set this value to zero (0) to specify the default value of 10,000 objects.
     * @param {Pointer<Pointer<CRYPT_OBJECT_LOCATOR_PROVIDER_TABLE>>} ppFuncTable A <a href="https://docs.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_object_locator_provider_table">CRYPT_OBJECT_LOCATOR_PROVIDER_TABLE</a> structure that contains pointers to the functions implemented by the provider. No pointers in the table can be <b>NULL</b>. The caller does not free this structure. It is expected that the provider will return a table that is not allocated on the heap.
     * @param {Pointer<Pointer<Void>>} ppPluginContext Pointer to an optional buffer defined by this provider. The buffer is not modified by the caller. Your provider can use the data to help it determine what actions to perform or to maintain additional information. This value may be set to <b>NULL</b>.
     * @returns {BOOL} If the function succeeds, return nonzero (<b>TRUE</b>).
     * 
     * If the function fails, return zero (<b>FALSE</b>) and specify an appropriate error in the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> function. Most errors are passed through Schannel unaltered but this behavior is not guaranteed. Some errors may be mapped to other errors.
     */
    Call(pfnFlush, pContext, pdwExpectedObjectCount, ppFuncTable, ppPluginContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"
        pdwExpectedObjectCountMarshal := pdwExpectedObjectCount is VarRef ? "uint*" : "ptr"
        ppFuncTableMarshal := ppFuncTable is VarRef ? "ptr*" : "ptr"
        ppPluginContextMarshal := ppPluginContext is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "ptr", pfnFlush, pContextMarshal, pContext, pdwExpectedObjectCountMarshal, pdwExpectedObjectCount, ppFuncTableMarshal, ppFuncTable, ppPluginContextMarshal, ppPluginContext, BOOL)
        return result
    }

    /**
     * A PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_INITIALIZE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_INITIALIZE {
        /**
         * Creates a PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_INITIALIZE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", "uint*", "ptr*", "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", "uint*", "ptr*", "ptr*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
