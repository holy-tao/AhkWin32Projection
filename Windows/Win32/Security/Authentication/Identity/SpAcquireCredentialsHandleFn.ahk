#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * Called to obtain a handle to a principal's credentials.
 * @remarks
 * The package can use the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">Local Security Authority</a> (LSA) support functions to determine whether the caller should be given access to the requested credentials.
 * 
 * Credentials obtained from <b>SpAcquireCredentialsHandle</b> are freed by calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spfreecredentialshandlefn">SpFreeCredentialsHandle</a> function.
 * 
 * SSP/APs must implement the <b>SpAcquireCredentialsHandle</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpAcquireCredentialsHandle</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spacquirecredentialshandlefn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpAcquireCredentialsHandleFn {
    value : IntPtr

    __value {
        set {
            if (value is SpAcquireCredentialsHandleFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LSA_UNICODE_STRING>} PrincipalName Optional. Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure containing the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security principal</a> whose credentials are being requested. If this value is <b>NULL</b>, the caller requests a handle to the credentials of the user in whose <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> the caller is executing.
     * @param {Integer} CredentialUseFlags Flags indicating how the credentials will be used. The following values are valid.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CRED_INBOUND"></a><a id="secpkg_cred_inbound"></a><dl>
     * <dt><b>SECPKG_CRED_INBOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Credentials will be used with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CRED_OUTBOUND"></a><a id="secpkg_cred_outbound"></a><dl>
     * <dt><b>SECPKG_CRED_OUTBOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Credentials will be used with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<LUID>} LogonId Optional. Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> containing the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon identifier</a> of the security principal.
     * @param {Pointer<Void>} AuthorizationData Optional. Pointer to supplemental authentication data.
     * @param {Pointer<Void>} GetKeyFunciton 
     * @param {Pointer<Void>} GetKeyArgument Pointer to the argument used with the <i>GetKeyFunction</i> function.
     * @param {Pointer<Pointer>} CredentialHandle Pointer to an <b>LSA_SEC_HANDLE</b> that receives the credentials. When you have finished using the credentials, free the handle by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spfreecredentialshandlefn">SpFreeCredentialsHandle</a> function.
     * @param {Pointer<Integer>} ExpirationTime Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/timestamp">TimeStamp</a> that receives the time the credentials handle expires.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed. The following table lists common reasons for failure and the error codes that should be returned.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_NOT_OWNER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is denied access.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_NO_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no credentials available for the specified principal.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(PrincipalName, CredentialUseFlags, LogonId, AuthorizationData, GetKeyFunciton, GetKeyArgument, CredentialHandle, ExpirationTime) {
        AuthorizationDataMarshal := AuthorizationData is VarRef ? "ptr" : "ptr"
        GetKeyFuncitonMarshal := GetKeyFunciton is VarRef ? "ptr" : "ptr"
        GetKeyArgumentMarshal := GetKeyArgument is VarRef ? "ptr" : "ptr"
        CredentialHandleMarshal := CredentialHandle is VarRef ? "ptr*" : "ptr"
        ExpirationTimeMarshal := ExpirationTime is VarRef ? "int64*" : "ptr"

        result := DllCall(this.value, LSA_UNICODE_STRING.Ptr, PrincipalName, UInt32, CredentialUseFlags, LUID.Ptr, LogonId, AuthorizationDataMarshal, AuthorizationData, GetKeyFuncitonMarshal, GetKeyFunciton, GetKeyArgumentMarshal, GetKeyArgument, CredentialHandleMarshal, CredentialHandle, ExpirationTimeMarshal, ExpirationTime, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpAcquireCredentialsHandleFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpAcquireCredentialsHandleFn {
        /**
         * Creates a SpAcquireCredentialsHandleFn pointer that invokes the given AHK function when called.
         * @param {Func(LSA_UNICODE_STRING, UInt32, LUID, "ptr", "ptr", "ptr", "ptr*", "int64*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LSA_UNICODE_STRING.Ptr, UInt32, LUID.Ptr, "ptr", "ptr", "ptr", "ptr*", "int64*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
