#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ACCEPT_SECURITY_CONTEXT_FN.ahk" { ACCEPT_SECURITY_CONTEXT_FN }
#Import ".\ACQUIRE_CREDENTIALS_HANDLE_FN_W.ahk" { ACQUIRE_CREDENTIALS_HANDLE_FN_W }
#Import ".\ADD_CREDENTIALS_FN_W.ahk" { ADD_CREDENTIALS_FN_W }
#Import ".\APPLY_CONTROL_TOKEN_FN.ahk" { APPLY_CONTROL_TOKEN_FN }
#Import ".\CHANGE_PASSWORD_FN_W.ahk" { CHANGE_PASSWORD_FN_W }
#Import ".\COMPLETE_AUTH_TOKEN_FN.ahk" { COMPLETE_AUTH_TOKEN_FN }
#Import ".\DECRYPT_MESSAGE_FN.ahk" { DECRYPT_MESSAGE_FN }
#Import ".\DELETE_SECURITY_CONTEXT_FN.ahk" { DELETE_SECURITY_CONTEXT_FN }
#Import ".\ENCRYPT_MESSAGE_FN.ahk" { ENCRYPT_MESSAGE_FN }
#Import ".\ENUMERATE_SECURITY_PACKAGES_FN_W.ahk" { ENUMERATE_SECURITY_PACKAGES_FN_W }
#Import ".\EXPORT_SECURITY_CONTEXT_FN.ahk" { EXPORT_SECURITY_CONTEXT_FN }
#Import ".\FREE_CONTEXT_BUFFER_FN.ahk" { FREE_CONTEXT_BUFFER_FN }
#Import ".\FREE_CREDENTIALS_HANDLE_FN.ahk" { FREE_CREDENTIALS_HANDLE_FN }
#Import ".\IMPERSONATE_SECURITY_CONTEXT_FN.ahk" { IMPERSONATE_SECURITY_CONTEXT_FN }
#Import ".\IMPORT_SECURITY_CONTEXT_FN_W.ahk" { IMPORT_SECURITY_CONTEXT_FN_W }
#Import ".\INITIALIZE_SECURITY_CONTEXT_FN_W.ahk" { INITIALIZE_SECURITY_CONTEXT_FN_W }
#Import ".\MAKE_SIGNATURE_FN.ahk" { MAKE_SIGNATURE_FN }
#Import ".\QUERY_CONTEXT_ATTRIBUTES_EX_FN_W.ahk" { QUERY_CONTEXT_ATTRIBUTES_EX_FN_W }
#Import ".\QUERY_CONTEXT_ATTRIBUTES_FN_W.ahk" { QUERY_CONTEXT_ATTRIBUTES_FN_W }
#Import ".\QUERY_CREDENTIALS_ATTRIBUTES_EX_FN_W.ahk" { QUERY_CREDENTIALS_ATTRIBUTES_EX_FN_W }
#Import ".\QUERY_CREDENTIALS_ATTRIBUTES_FN_W.ahk" { QUERY_CREDENTIALS_ATTRIBUTES_FN_W }
#Import ".\QUERY_SECURITY_CONTEXT_TOKEN_FN.ahk" { QUERY_SECURITY_CONTEXT_TOKEN_FN }
#Import ".\QUERY_SECURITY_PACKAGE_INFO_FN_W.ahk" { QUERY_SECURITY_PACKAGE_INFO_FN_W }
#Import ".\REVERT_SECURITY_CONTEXT_FN.ahk" { REVERT_SECURITY_CONTEXT_FN }
#Import ".\SET_CONTEXT_ATTRIBUTES_FN_W.ahk" { SET_CONTEXT_ATTRIBUTES_FN_W }
#Import ".\SET_CREDENTIALS_ATTRIBUTES_FN_W.ahk" { SET_CREDENTIALS_ATTRIBUTES_FN_W }
#Import ".\VERIFY_SIGNATURE_FN.ahk" { VERIFY_SIGNATURE_FN }

/**
 * The SecurityFunctionTable structure is a dispatch table that contains pointers to the functions defined in SSPI. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines SecurityFunctionTable as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * QueryContextAttributesExW and QueryCredentialsAttributesW are not initialized.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-securityfunctiontablew
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset Unicode
 */
export default struct SecurityFunctionTableW {
    #StructPack 8

    /**
     * Version number of the table.
     */
    dwVersion : UInt32

    EnumerateSecurityPackagesW : ENUMERATE_SECURITY_PACKAGES_FN_W

    QueryCredentialsAttributesW : QUERY_CREDENTIALS_ATTRIBUTES_FN_W

    AcquireCredentialsHandleW : ACQUIRE_CREDENTIALS_HANDLE_FN_W

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecredentialshandle">FreeCredentialsHandle</a> function.
     */
    FreeCredentialsHandle : FREE_CREDENTIALS_HANDLE_FN

    /**
     * Reserved for future use.
     */
    Reserved2 : IntPtr

    InitializeSecurityContextW : INITIALIZE_SECURITY_CONTEXT_FN_W

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> function.
     */
    AcceptSecurityContext : ACCEPT_SECURITY_CONTEXT_FN

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> function.
     */
    CompleteAuthToken : COMPLETE_AUTH_TOKEN_FN

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-deletesecuritycontext">DeleteSecurityContext</a> function.
     */
    DeleteSecurityContext : DELETE_SECURITY_CONTEXT_FN

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-applycontroltoken">ApplyControlToken</a> function.
     */
    ApplyControlToken : APPLY_CONTROL_TOKEN_FN

    QueryContextAttributesW : QUERY_CONTEXT_ATTRIBUTES_FN_W

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-impersonatesecuritycontext">ImpersonateSecurityContext</a> function.
     */
    ImpersonateSecurityContext : IMPERSONATE_SECURITY_CONTEXT_FN

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-revertsecuritycontext">RevertSecurityContext</a> function.
     */
    RevertSecurityContext : REVERT_SECURITY_CONTEXT_FN

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> function.
     */
    MakeSignature : MAKE_SIGNATURE_FN

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-verifysignature">VerifySignature</a> function.
     */
    VerifySignature : VERIFY_SIGNATURE_FN

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
     */
    FreeContextBuffer : FREE_CONTEXT_BUFFER_FN

    QuerySecurityPackageInfoW : QUERY_SECURITY_PACKAGE_INFO_FN_W

    /**
     * Reserved for future use.
     */
    Reserved3 : IntPtr

    /**
     * Reserved for future use.
     */
    Reserved4 : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-exportsecuritycontext">ExportSecurityContext</a> function.
     */
    ExportSecurityContext : EXPORT_SECURITY_CONTEXT_FN

    ImportSecurityContextW : IMPORT_SECURITY_CONTEXT_FN_W

    AddCredentialsW : ADD_CREDENTIALS_FN_W

    /**
     * Reserved for future use.
     */
    Reserved8 : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querysecuritycontexttoken">QuerySecurityContextToken</a> function.
     */
    QuerySecurityContextToken : QUERY_SECURITY_CONTEXT_TOKEN_FN

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage (General)</a> function.
     */
    EncryptMessage : ENCRYPT_MESSAGE_FN

    /**
     * Pointer to the   <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-decryptmessage">DecryptMessage (General)</a> function.
     */
    DecryptMessage : DECRYPT_MESSAGE_FN

    SetContextAttributesW : SET_CONTEXT_ATTRIBUTES_FN_W

    SetCredentialsAttributesW : SET_CREDENTIALS_ATTRIBUTES_FN_W

    ChangeAccountPasswordW : CHANGE_PASSWORD_FN_W

    QueryContextAttributesExW : QUERY_CONTEXT_ATTRIBUTES_EX_FN_W

    QueryCredentialsAttributesExW : QUERY_CREDENTIALS_ATTRIBUTES_EX_FN_W

}
