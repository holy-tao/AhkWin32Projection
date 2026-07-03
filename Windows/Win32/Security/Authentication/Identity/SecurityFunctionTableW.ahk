#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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

    EnumerateSecurityPackagesW : IntPtr

    QueryCredentialsAttributesW : IntPtr

    AcquireCredentialsHandleW : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecredentialshandle">FreeCredentialsHandle</a> function.
     */
    FreeCredentialsHandle : IntPtr

    /**
     * Reserved for future use.
     */
    Reserved2 : IntPtr

    InitializeSecurityContextW : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> function.
     */
    AcceptSecurityContext : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> function.
     */
    CompleteAuthToken : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-deletesecuritycontext">DeleteSecurityContext</a> function.
     */
    DeleteSecurityContext : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-applycontroltoken">ApplyControlToken</a> function.
     */
    ApplyControlToken : IntPtr

    QueryContextAttributesW : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-impersonatesecuritycontext">ImpersonateSecurityContext</a> function.
     */
    ImpersonateSecurityContext : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-revertsecuritycontext">RevertSecurityContext</a> function.
     */
    RevertSecurityContext : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> function.
     */
    MakeSignature : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-verifysignature">VerifySignature</a> function.
     */
    VerifySignature : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
     */
    FreeContextBuffer : IntPtr

    QuerySecurityPackageInfoW : IntPtr

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
    ExportSecurityContext : IntPtr

    ImportSecurityContextW : IntPtr

    AddCredentialsW : IntPtr

    /**
     * Reserved for future use.
     */
    Reserved8 : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querysecuritycontexttoken">QuerySecurityContextToken</a> function.
     */
    QuerySecurityContextToken : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage (General)</a> function.
     */
    EncryptMessage : IntPtr

    /**
     * Pointer to the   <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-decryptmessage">DecryptMessage (General)</a> function.
     */
    DecryptMessage : IntPtr

    SetContextAttributesW : IntPtr

    SetCredentialsAttributesW : IntPtr

    ChangeAccountPasswordW : IntPtr

    QueryContextAttributesExW : IntPtr

    QueryCredentialsAttributesExW : IntPtr

}
