#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\SECPKG_PRIMARY_CRED.ahk" { SECPKG_PRIMARY_CRED }
#Import ".\SECPKG_SUPPLEMENTAL_CRED.ahk" { SECPKG_SUPPLEMENTAL_CRED }
#Import ".\SECURITY_LOGON_TYPE.ahk" { SECURITY_LOGON_TYPE }

/**
 * Called by the Local Security Authority (LSA) to pass the security package any credentials stored for the authenticated security principal.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> should save the credentials so that it can service requests for credentials. For additional information, see the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spacquirecredentialshandlefn">SpAcquireCredentialsHandle</a> function.
 * 
 * SSP/APs must implement the <b>SpAcceptCredentials</b> function; unlike other SSP/AP functions the name of the function must be <b>SpAcceptCredentials</b>.
 * 
 * The LSA accesses the <b>SpAcceptCredentials</b> function through the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spacceptcredentialsfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpAcceptCredentialsFn {
    value : IntPtr

    __value {
        set {
            if (value is SpAcceptCredentialsFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SECURITY_LOGON_TYPE} LogonType A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-security_logon_type">SECURITY_LOGON_TYPE</a> value indicating the type of logon.
     * @param {Pointer<LSA_UNICODE_STRING>} AccountName Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure specifying the name of the logged-on account.
     * @param {Pointer<SECPKG_PRIMARY_CRED>} PrimaryCredentials Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_primary_cred">SECPKG_PRIMARY_CRED</a> structure containing the credentials used to logon. This structure can have <b>NULL</b> members.
     * @param {Pointer<SECPKG_SUPPLEMENTAL_CRED>} SupplementalCredentials Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_supplemental_cred">SECPKG_SUPPLEMENTAL_CRED</a> structure containing package-specific <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">supplemental credentials</a>.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     */
    Call(LogonType, AccountName, PrimaryCredentials, SupplementalCredentials) {
        result := DllCall(this.value, SECURITY_LOGON_TYPE, LogonType, LSA_UNICODE_STRING.Ptr, AccountName, SECPKG_PRIMARY_CRED.Ptr, PrimaryCredentials, SECPKG_SUPPLEMENTAL_CRED.Ptr, SupplementalCredentials, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpAcceptCredentialsFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpAcceptCredentialsFn {
        /**
         * Creates a SpAcceptCredentialsFn pointer that invokes the given AHK function when called.
         * @param {Func(SECURITY_LOGON_TYPE, LSA_UNICODE_STRING, SECPKG_PRIMARY_CRED, SECPKG_SUPPLEMENTAL_CRED) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SECURITY_LOGON_TYPE, LSA_UNICODE_STRING.Ptr, SECPKG_PRIMARY_CRED.Ptr, SECPKG_SUPPLEMENTAL_CRED.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
