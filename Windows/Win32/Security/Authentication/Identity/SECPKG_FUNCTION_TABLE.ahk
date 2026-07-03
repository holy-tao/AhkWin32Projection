#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_AP_POST_LOGON_USER.ahk" { LSA_AP_POST_LOGON_USER }
#Import ".\PLSA_AP_CALL_PACKAGE.ahk" { PLSA_AP_CALL_PACKAGE }
#Import ".\PLSA_AP_CALL_PACKAGE_PASSTHROUGH.ahk" { PLSA_AP_CALL_PACKAGE_PASSTHROUGH }
#Import ".\PLSA_AP_INITIALIZE_PACKAGE.ahk" { PLSA_AP_INITIALIZE_PACKAGE }
#Import ".\PLSA_AP_LOGON_TERMINATED.ahk" { PLSA_AP_LOGON_TERMINATED }
#Import ".\PLSA_AP_LOGON_USER.ahk" { PLSA_AP_LOGON_USER }
#Import ".\PLSA_AP_LOGON_USER_EX.ahk" { PLSA_AP_LOGON_USER_EX }
#Import ".\PLSA_AP_LOGON_USER_EX2.ahk" { PLSA_AP_LOGON_USER_EX2 }
#Import ".\PLSA_AP_LOGON_USER_EX3.ahk" { PLSA_AP_LOGON_USER_EX3 }
#Import ".\PLSA_AP_POST_LOGON_USER_SURROGATE.ahk" { PLSA_AP_POST_LOGON_USER_SURROGATE }
#Import ".\PLSA_AP_PRE_LOGON_USER_SURROGATE.ahk" { PLSA_AP_PRE_LOGON_USER_SURROGATE }
#Import ".\SpAcceptCredentialsFn.ahk" { SpAcceptCredentialsFn }
#Import ".\SpAcceptLsaModeContextFn.ahk" { SpAcceptLsaModeContextFn }
#Import ".\SpAcquireCredentialsHandleFn.ahk" { SpAcquireCredentialsHandleFn }
#Import ".\SpAddCredentialsFn.ahk" { SpAddCredentialsFn }
#Import ".\SpApplyControlTokenFn.ahk" { SpApplyControlTokenFn }
#Import ".\SpChangeAccountPasswordFn.ahk" { SpChangeAccountPasswordFn }
#Import ".\SpDeleteContextFn.ahk" { SpDeleteContextFn }
#Import ".\SpDeleteCredentialsFn.ahk" { SpDeleteCredentialsFn }
#Import ".\SpExchangeMetaDataFn.ahk" { SpExchangeMetaDataFn }
#Import ".\SpExtractTargetInfoFn.ahk" { SpExtractTargetInfoFn }
#Import ".\SpFreeCredentialsHandleFn.ahk" { SpFreeCredentialsHandleFn }
#Import ".\SpGetCredUIContextFn.ahk" { SpGetCredUIContextFn }
#Import ".\SpGetCredentialsFn.ahk" { SpGetCredentialsFn }
#Import ".\SpGetExtendedInformationFn.ahk" { SpGetExtendedInformationFn }
#Import ".\SpGetInfoFn.ahk" { SpGetInfoFn }
#Import ".\SpGetRemoteCredGuardLogonBufferFn.ahk" { SpGetRemoteCredGuardLogonBufferFn }
#Import ".\SpGetRemoteCredGuardSupplementalCredsFn.ahk" { SpGetRemoteCredGuardSupplementalCredsFn }
#Import ".\SpGetTbalSupplementalCredsFn.ahk" { SpGetTbalSupplementalCredsFn }
#Import ".\SpGetUserInfoFn.ahk" { SpGetUserInfoFn }
#Import ".\SpInitLsaModeContextFn.ahk" { SpInitLsaModeContextFn }
#Import ".\SpInitializeFn.ahk" { SpInitializeFn }
#Import ".\SpQueryContextAttributesFn.ahk" { SpQueryContextAttributesFn }
#Import ".\SpQueryCredentialsAttributesFn.ahk" { SpQueryCredentialsAttributesFn }
#Import ".\SpQueryMetaDataFn.ahk" { SpQueryMetaDataFn }
#Import ".\SpSaveCredentialsFn.ahk" { SpSaveCredentialsFn }
#Import ".\SpSetContextAttributesFn.ahk" { SpSetContextAttributesFn }
#Import ".\SpSetCredentialsAttributesFn.ahk" { SpSetCredentialsAttributesFn }
#Import ".\SpSetExtendedInformationFn.ahk" { SpSetExtendedInformationFn }
#Import ".\SpShutdownFn.ahk" { SpShutdownFn }
#Import ".\SpUpdateCredentialsFn.ahk" { SpUpdateCredentialsFn }
#Import ".\SpValidateTargetInfoFn.ahk" { SpValidateTargetInfoFn }

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
    InitializePackage : PLSA_AP_INITIALIZE_PACKAGE

    LogonUserA : PLSA_AP_LOGON_USER

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_call_package">CallPackage</a> function.
     */
    CallPackage : PLSA_AP_CALL_PACKAGE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_ap_logon_terminated">LsaApLogonTerminated</a> function.
     */
    LogonTerminated : PLSA_AP_LOGON_TERMINATED

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa378218(v=vs.85)">LsaApCallPackageUntrusted</a>  function.
     */
    CallPackageUntrusted : PLSA_AP_CALL_PACKAGE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_call_package_passthrough">CallPackagePassthrough</a> function.
     */
    CallPackagePassthrough : PLSA_AP_CALL_PACKAGE_PASSTHROUGH

    LogonUserExA : PLSA_AP_LOGON_USER_EX

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_ap_logon_user_ex2">LsaApLogonUserEx2</a> function.
     */
    LogonUserEx2 : PLSA_AP_LOGON_USER_EX2

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spinitializefn">SpInitialize</a> function.
     */
    Initialize : SpInitializeFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380183(v=vs.85)">SpShutdown</a> function.
     */
    Shutdown : SpShutdownFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spgetinfofn">SpGetInfo</a> function.
     */
    GetInfo : SpGetInfoFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spacceptcredentialsfn">SpAcceptCredentials</a> function.
     */
    AcceptCredentials : SpAcceptCredentialsFn

    AcquireCredentialsHandleA : SpAcquireCredentialsHandleFn

    QueryCredentialsAttributesA : SpQueryCredentialsAttributesFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecredentialshandle">FreeCredentialsHandle</a> function.
     */
    FreeCredentialsHandle : SpFreeCredentialsHandleFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spsavecredentialsfn">SpSaveCredentials</a> function.
     */
    SaveCredentials : SpSaveCredentialsFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_credentials">GetCredentials</a> function.
     */
    GetCredentials : SpGetCredentialsFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spdeletecredentialsfn">SpDeleteCredentials</a> function.
     */
    DeleteCredentials : SpDeleteCredentialsFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spinitlsamodecontextfn">SpInitLsaModeContext</a> function.
     */
    InitLsaModeContext : SpInitLsaModeContextFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spacceptlsamodecontextfn">SpAcceptLsaModeContext</a> function.
     */
    AcceptLsaModeContext : SpAcceptLsaModeContextFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-kspdeletecontextfn">SpDeleteContext</a> function.
     */
    DeleteContext : SpDeleteContextFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-applycontroltoken">ApplyControlToken</a> function.
     */
    ApplyControlToken : SpApplyControlTokenFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spgetuserinfofn">SpGetUserInfo</a> function.
     */
    GetUserInfo : SpGetUserInfoFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spgetextendedinformationfn">SpGetExtendedInformation
     * </a> function.
     */
    GetExtendedInformation : SpGetExtendedInformationFn

    QueryContextAttributesA : SpQueryContextAttributesFn

    AddCredentialsA : SpAddCredentialsFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spsetextendedinformationfn">SpSetExtendedInformation</a> function.
     */
    SetExtendedInformation : SpSetExtendedInformationFn

    SetContextAttributesA : SpSetContextAttributesFn

    SetCredentialsAttributesA : SpSetCredentialsAttributesFn

    ChangeAccountPasswordA : SpChangeAccountPasswordFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spquerymetadatafn">QueryMetaData</a> function.
     */
    QueryMetaData : SpQueryMetaDataFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spexchangemetadatafn">ExchangeMetaData</a> function.
     */
    ExchangeMetaData : SpExchangeMetaDataFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spgetcreduicontextfn">GetCredUIContext</a> function.
     */
    GetCredUIContext : SpGetCredUIContextFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spupdatecredentialsfn">UpdateCredentials</a> function.
     */
    UpdateCredentials : SpUpdateCredentialsFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spvalidatetargetinfofn">SpValidateTargetInfoFn</a> function.
     */
    ValidateTargetInfo : SpValidateTargetInfoFn

    PostLogonUser : LSA_AP_POST_LOGON_USER

    GetRemoteCredGuardLogonBuffer : SpGetRemoteCredGuardLogonBufferFn

    GetRemoteCredGuardSupplementalCreds : SpGetRemoteCredGuardSupplementalCredsFn

    GetTbalSupplementalCreds : SpGetTbalSupplementalCredsFn

    LogonUserEx3 : PLSA_AP_LOGON_USER_EX3

    PreLogonUserSurrogate : PLSA_AP_PRE_LOGON_USER_SURROGATE

    PostLogonUserSurrogate : PLSA_AP_POST_LOGON_USER_SURROGATE

    ExtractTargetInfo : SpExtractTargetInfoFn

}
