#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\ENCRYPTED_CREDENTIALW.ahk" { ENCRYPTED_CREDENTIALW }

/**
 * Writes the specified credential to the Credential Manager.
 * @remarks
 * A pointer to the <b>CrediWrite</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-lsa_secpkg_function_table">LSA_SECPKG_FUNCTION_TABLE</a> structure received by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spinitializefn">SpInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-credwritefn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct CredWriteFn {
    value : IntPtr

    __value {
        set {
            if (value is CredWriteFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LUID>} LogonId The logon ID for which to read credentials.
     * @param {Integer} CredFlags Flags that determine the behavior of this function. The following flags are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREDP_FLAGS_IN_PROCESS"></a><a id="credp_flags_in_process"></a><dl>
     * <dt><b>CREDP_FLAGS_IN_PROCESS</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is in-process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREDP_FLAGS_USE_MIDL_HEAP"></a><a id="credp_flags_use_midl_heap"></a><dl>
     * <dt><b>CREDP_FLAGS_USE_MIDL_HEAP</b></dt>
     * <dt>0x02</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller should use the <a href="https://docs.microsoft.com/windows/desktop/Rpc/the-midl-user-allocate-function">midl_user_allocate</a> function to allocate the <i>Credential</i> buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREDP_FLAGS_DONT_CACHE_TI"></a><a id="credp_flags_dont_cache_ti"></a><dl>
     * <dt><b>CREDP_FLAGS_DONT_CACHE_TI</b></dt>
     * <dt>0x04</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not cache target information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREDP_FLAGS_CLEAR_PASSWORD"></a><a id="credp_flags_clear_password"></a><dl>
     * <dt><b>CREDP_FLAGS_CLEAR_PASSWORD</b></dt>
     * <dt>0x08</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credential data is passed as clear text.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREDP_FLAGS_USER_ENCRYPTED_PASSWORD"></a><a id="credp_flags_user_encrypted_password"></a><dl>
     * <dt><b>CREDP_FLAGS_USER_ENCRYPTED_PASSWORD</b></dt>
     * <dt>0x10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The credential data is encrypted by using the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-rtlencryptmemory">RtlEncryptMemory</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREDP_FLAGS_TRUSTED_CALLER"></a><a id="credp_flags_trusted_caller"></a><dl>
     * <dt><b>CREDP_FLAGS_TRUSTED_CALLER</b></dt>
     * <dt>0x20</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is a trusted process.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<ENCRYPTED_CREDENTIALW>} Credential A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-encrypted_credentialw">ENCRYPTED_CREDENTIALW</a> structure that represents the credentials to write.
     * @param {Integer} Flags Reserved. This parameter must be set to zero.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS, or an informational status code.
     * 
     * If the function fails, return an NTSTATUS error code that indicates the reason it failed.
     */
    Call(LogonId, CredFlags, Credential, Flags) {
        result := DllCall(this.value, LUID.Ptr, LogonId, UInt32, CredFlags, ENCRYPTED_CREDENTIALW.Ptr, Credential, UInt32, Flags, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A CredWriteFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CredWriteFn {
        /**
         * Creates a CredWriteFn pointer that invokes the given AHK function when called.
         * @param {Func(LUID, UInt32, ENCRYPTED_CREDENTIALW, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LUID.Ptr, UInt32, ENCRYPTED_CREDENTIALW.Ptr, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
