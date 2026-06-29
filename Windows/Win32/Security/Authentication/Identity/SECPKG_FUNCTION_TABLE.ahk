#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SECPKG_FUNCTION_TABLE structure contains pointers to the LSA functions that a security package must implement. The Local Security Authority (LSA) obtains this structure from an SSP/AP DLL when it calls the SpLsaModeInitialize function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_FUNCTION_TABLE {
    #StructPack 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_ap_initialize_package">LsaApInitializePackage</a> function.
     */
    InitializePackage : IntPtr

    LogonUserA : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_call_package">CallPackage</a> function.
     */
    CallPackage : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_ap_logon_terminated">LsaApLogonTerminated</a> function.
     */
    LogonTerminated : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa378218(v=vs.85)">LsaApCallPackageUntrusted</a>  function.
     */
    CallPackageUntrusted : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_call_package_passthrough">CallPackagePassthrough</a> function.
     */
    CallPackagePassthrough : IntPtr

    LogonUserExA : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_ap_logon_user_ex2">LsaApLogonUserEx2</a> function.
     */
    LogonUserEx2 : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spinitializefn">SpInitialize</a> function.
     */
    Initialize : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380183(v=vs.85)">SpShutdown</a> function.
     */
    Shutdown : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spgetinfofn">SpGetInfo</a> function.
     */
    GetInfo : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spacceptcredentialsfn">SpAcceptCredentials</a> function.
     */
    AcceptCredentials : IntPtr

    AcquireCredentialsHandleA : IntPtr

    QueryCredentialsAttributesA : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecredentialshandle">FreeCredentialsHandle</a> function.
     */
    FreeCredentialsHandle : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spsavecredentialsfn">SpSaveCredentials</a> function.
     */
    SaveCredentials : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_credentials">GetCredentials</a> function.
     */
    GetCredentials : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spdeletecredentialsfn">SpDeleteCredentials</a> function.
     */
    DeleteCredentials : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spinitlsamodecontextfn">SpInitLsaModeContext</a> function.
     */
    InitLsaModeContext : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spacceptlsamodecontextfn">SpAcceptLsaModeContext</a> function.
     */
    AcceptLsaModeContext : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-kspdeletecontextfn">SpDeleteContext</a> function.
     */
    DeleteContext : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-applycontroltoken">ApplyControlToken</a> function.
     */
    ApplyControlToken : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spgetuserinfofn">SpGetUserInfo</a> function.
     */
    GetUserInfo : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spgetextendedinformationfn">SpGetExtendedInformation
     * </a> function.
     */
    GetExtendedInformation : IntPtr

    QueryContextAttributesA : IntPtr

    AddCredentialsA : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spsetextendedinformationfn">SpSetExtendedInformation</a> function.
     */
    SetExtendedInformation : IntPtr

    SetContextAttributesA : IntPtr

    SetCredentialsAttributesA : IntPtr

    ChangeAccountPasswordA : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spquerymetadatafn">QueryMetaData</a> function.
     */
    QueryMetaData : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spexchangemetadatafn">ExchangeMetaData</a> function.
     */
    ExchangeMetaData : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spgetcreduicontextfn">GetCredUIContext</a> function.
     */
    GetCredUIContext : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spupdatecredentialsfn">UpdateCredentials</a> function.
     */
    UpdateCredentials : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spvalidatetargetinfofn">SpValidateTargetInfoFn</a> function.
     */
    ValidateTargetInfo : IntPtr

    PostLogonUser : IntPtr

    GetRemoteCredGuardLogonBuffer : IntPtr

    GetRemoteCredGuardSupplementalCreds : IntPtr

    GetTbalSupplementalCreds : IntPtr

    LogonUserEx3 : IntPtr

    PreLogonUserSurrogate : IntPtr

    PostLogonUserSurrogate : IntPtr

    ExtractTargetInfo : IntPtr

}
