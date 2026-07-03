#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SECPKG_USER_FUNCTION_TABLE structure contains pointers to the functions that a security package implements to support executing in process with client/server applications. This structure is provided by the SpUserModeInitialize function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_user_function_table
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_USER_FUNCTION_TABLE {
    #StructPack 8

    /**
     * Pointer to the <b>InstanceInit</b> function.
     */
    InstanceInit : IntPtr

    /**
     * Pointer to the <b>InitUserModeContext</b> function.
     */
    InitUserModeContext : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> function.
     */
    MakeSignature : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-verifysignature">VerifySignature</a> function.
     */
    VerifySignature : IntPtr

    /**
     * Pointer to the <b>SealMessage</b> function.
     */
    SealMessage : IntPtr

    /**
     * Pointer to the <b>UnsealMessage</b> function.
     */
    UnsealMessage : IntPtr

    /**
     * Pointer to the <b>GetContextToken</b> function.
     */
    GetContextToken : IntPtr

    QueryContextAttributesA : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> function.
     */
    CompleteAuthToken : IntPtr

    /**
     * Pointer to the <b>DeleteUserModeContext</b> function.
     */
    DeleteUserModeContext : IntPtr

    /**
     * Pointer to the <b>FormatCredentials</b> function.
     */
    FormatCredentials : IntPtr

    /**
     * Pointer to the <b>MarshallSupplementalCreds</b> function.
     */
    MarshallSupplementalCreds : IntPtr

    /**
     * Pointer to the <b>ExportContext</b> function.
     */
    ExportContext : IntPtr

    /**
     * Pointer to the <b>ImportContext</b> function.
     */
    ImportContext : IntPtr

    MarshalAttributeData : IntPtr

}
