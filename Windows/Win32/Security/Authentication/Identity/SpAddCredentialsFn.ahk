#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * Used to add credentials for a security principal.
 * @remarks
 * SSP/APs must implement the <b>SpAddCredentials</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpAddCredentials</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spaddcredentialsfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpAddCredentialsFn {
    value : IntPtr

    __value {
        set {
            if (value is SpAddCredentialsFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} CredentialHandle A handle to the credential to add.
     * @param {Pointer<LSA_UNICODE_STRING>} PrincipalName Optional. Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure containing the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security principal</a> whose credentials are being added.
     * @param {Pointer<LSA_UNICODE_STRING>} Package Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure containing the name of the authenticating package.
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
     * @param {Pointer<Void>} AuthorizationData Optional. Pointer to supplemental authentication data.
     * @param {Pointer<Void>} GetKeyFunciton 
     * @param {Pointer<Void>} GetKeyArgument Pointer to the argument used with the <i>GetKeyFunction</i> function.
     * @param {Pointer<Integer>} ExpirationTime Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/timestamp">TimeStamp</a> that receives the time the credentials handle expires.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     */
    Call(CredentialHandle, PrincipalName, Package, CredentialUseFlags, AuthorizationData, GetKeyFunciton, GetKeyArgument, ExpirationTime) {
        AuthorizationDataMarshal := AuthorizationData is VarRef ? "ptr" : "ptr"
        GetKeyFuncitonMarshal := GetKeyFunciton is VarRef ? "ptr" : "ptr"
        GetKeyArgumentMarshal := GetKeyArgument is VarRef ? "ptr" : "ptr"
        ExpirationTimeMarshal := ExpirationTime is VarRef ? "int64*" : "ptr"

        result := DllCall(this.value, IntPtr, CredentialHandle, LSA_UNICODE_STRING.Ptr, PrincipalName, LSA_UNICODE_STRING.Ptr, Package, UInt32, CredentialUseFlags, AuthorizationDataMarshal, AuthorizationData, GetKeyFuncitonMarshal, GetKeyFunciton, GetKeyArgumentMarshal, GetKeyArgument, ExpirationTimeMarshal, ExpirationTime, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpAddCredentialsFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpAddCredentialsFn {
        /**
         * Creates a SpAddCredentialsFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, LSA_UNICODE_STRING, LSA_UNICODE_STRING, UInt32, "ptr", "ptr", "ptr", "int64*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, UInt32, "ptr", "ptr", "ptr", "int64*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
