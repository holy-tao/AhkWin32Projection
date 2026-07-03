#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Retrieves an object.
 * @remarks
 * The <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET</b> callback function is currently called by only the Secure Channel (Schannel) security package. You can return an object that encapsulates one of the following:
 * 
 * <ul>
 * <li>A personal information exchange (PFX) byte array</li>
 * <li>A certificate store.</li>
 * <li>A generic BLOB. This is not currently supported by Schannel.</li>
 * </ul>
 * When this function is first called, Schannel submits a DNS host name in the <i>pNameBlob</i> argument to specify the host for which the object is intended. Your provider must process the name (match wild cards, build a file path, and so on) to determine what object to find.
 * 
 * Because many host names can be mapped to one object, your provider can use the <i>ppIdentifier</i> parameter to return an internally defined identifier that can be used in subsequent calls by the cryptography API (CAPI) functions to the provider. The provider can then use the identifier to assist in finding the appropriate object.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_get
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET) {
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
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pIdentifier Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dpapi/ns-dpapi-crypt_integer_blob">CRYPTOAPI_BLOB</a> structure that contains the object identifier. This value should always be <b>NULL</b> on the first call to this function.
     * @param {Integer} dwNameType The name format of the <i>pNameBlob</i> parameter. Possible values are listed below. The implementation of this function must be able to process <b>CRYPT_OBJECT_LOCATOR_SPN_NAME_TYPE</b>, which is passed in by Schannel.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pNameBlob Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dpapi/ns-dpapi-crypt_integer_blob">CRYPTOAPI_BLOB</a> structure that contains the name the calling application is using to uniquely identify the object. Your provider uses this name to locate the requested object. Schannel currently submits a DNS (domain name system) host name encoded in UTF8 with IDN names converted from punycode.
     * @param {Pointer<Pointer<Integer>>} ppbContent Pointer to a byte array that contains the object to be returned.
     * @param {Pointer<Integer>} pcbContent The size, in bytes, of the object pointed to by the <i>ppbContent</i> parameter.
     * @param {Pointer<PWSTR>} ppwszPassword Null-terminated Unicode string that contains the password, if any, used to encrypt the object. If the object is a personal information exchange (PFX) file, a password will typically be used to perform encryption. This value can be <b>NULL</b> if no password is required.
     * @param {Pointer<Pointer<CRYPT_INTEGER_BLOB>>} ppIdentifier Address that receives a pointer to an optional identifier that can be used during subsequent calls to this function and for change notifications. For more information, see Remarks. If your provider sets this value to <b>NULL</b>, Schannel internally uses the <i>pNameBlob</i> parameter value.
     * @returns {BOOL} If the function succeeds, return nonzero (<b>TRUE</b>).
     * 
     * If the function fails, return zero (<b>FALSE</b>) and specify an appropriate error in the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> function. Most errors are passed through Schannel unaltered but this behavior is not guaranteed. Some errors may be mapped to other errors.
     * 
     * If an object cannot be returned for a given DNS name (<i>pNameBlob</i>) or identifier (<i>pIdentifier</i>), return <b>FALSE</b> and specify <b>CRYPT_E_OBJECT_LOCATOR_OBJECT_NOT_FOUND</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> function.
     */
    Call(pPluginContext, pIdentifier, dwNameType, pNameBlob, ppbContent, pcbContent, ppwszPassword, ppIdentifier) {
        pPluginContextMarshal := pPluginContext is VarRef ? "ptr" : "ptr"
        ppbContentMarshal := ppbContent is VarRef ? "ptr*" : "ptr"
        pcbContentMarshal := pcbContent is VarRef ? "uint*" : "ptr"
        ppwszPasswordMarshal := ppwszPassword is VarRef ? "ptr*" : "ptr"
        ppIdentifierMarshal := ppIdentifier is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, pPluginContextMarshal, pPluginContext, CRYPT_INTEGER_BLOB.Ptr, pIdentifier, UInt32, dwNameType, CRYPT_INTEGER_BLOB.Ptr, pNameBlob, ppbContentMarshal, ppbContent, pcbContentMarshal, pcbContent, ppwszPasswordMarshal, ppwszPassword, ppIdentifierMarshal, ppIdentifier, BOOL)
        return result
    }

    /**
     * A PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET {
        /**
         * Creates a PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET pointer that invokes the given AHK function when called.
         * @param {Func("ptr", CRYPT_INTEGER_BLOB, UInt32, CRYPT_INTEGER_BLOB, "ptr*", "uint*", PWSTR, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", CRYPT_INTEGER_BLOB.Ptr, UInt32, CRYPT_INTEGER_BLOB.Ptr, "ptr*", "uint*", PWSTR.Ptr, "ptr*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
