#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * Retrieves the attributes for a credential.
 * @remarks
 * SSP/APs must implement the <b>SpQueryCredentialsAttributes</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpQueryCredentialsAttributes</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spquerycredentialsattributesfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpQueryCredentialsAttributesFn {
    value : IntPtr

    __value {
        set {
            if (value is SpQueryCredentialsAttributesFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} CredentialHandle A handle to the credential to query.
     * @param {Integer} CredentialAttribute <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Attribute</a> to query. The following table lists the valid values. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CRED_ATTR_NAMES"></a><a id="secpkg_cred_attr_names"></a><dl>
     * <dt><b>SECPKG_CRED_ATTR_NAMES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name of the principal associated with the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_ATTR_SUPPORTED_ALGS"></a><a id="secpkg_attr_supported_algs"></a><dl>
     * <dt><b>SECPKG_ATTR_SUPPORTED_ALGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The algorithms supported with a particular credential.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_ATTR_CIPHER_STRENGTHS"></a><a id="secpkg_attr_cipher_strengths"></a><dl>
     * <dt><b>SECPKG_ATTR_CIPHER_STRENGTHS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The minimum and maximum cipher strength used with a credential.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_ATTR_SUPPORTED_PROTOCOLS"></a><a id="secpkg_attr_supported_protocols"></a><dl>
     * <dt><b>SECPKG_ATTR_SUPPORTED_PROTOCOLS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocols supported with a particular credential.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} _Buffer Pointer to a buffer that receives the requested attributes. Allocate memory for this buffer using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_client_buffer">AllocateClientBuffer</a> function, so that caller can free it by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed. The following  lists common reasons for failure and the error codes that the function should return.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credential handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(CredentialHandle, CredentialAttribute, _Buffer) {
        _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, CredentialHandle, UInt32, CredentialAttribute, _BufferMarshal, _Buffer, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpQueryCredentialsAttributesFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpQueryCredentialsAttributesFn {
        /**
         * Creates a SpQueryCredentialsAttributesFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
