#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SECPKG_FUNCTION_TABLE structure contains pointers to the LSA functions that a security package must implement. The Local Security Authority (LSA) obtains this structure from an SSP/AP DLL when it calls the SpLsaModeInitialize function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_FUNCTION_TABLE extends Win32Struct
{
    static sizeof => 344

    static packingSize => 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_ap_initialize_package">LsaApInitializePackage</a> function.
     * @type {Pointer<Ptr>}
     */
    InitializePackage {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    LogonUserA {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_call_package">CallPackage</a> function.
     * @type {Pointer<Ptr>}
     */
    CallPackage {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_ap_logon_terminated">LsaApLogonTerminated</a> function.
     * @type {Pointer<Ptr>}
     */
    LogonTerminated {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa378218(v=vs.85)">LsaApCallPackageUntrusted</a>  function.
     * @type {Pointer<Ptr>}
     */
    CallPackageUntrusted {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_call_package_passthrough">CallPackagePassthrough</a> function.
     * @type {Pointer<Ptr>}
     */
    CallPackagePassthrough {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    LogonUserExA {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_ap_logon_user_ex2">LsaApLogonUserEx2</a> function.
     * @type {Pointer<Ptr>}
     */
    LogonUserEx2 {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spinitializefn">SpInitialize</a> function.
     * @type {Pointer<Ptr>}
     */
    Initialize {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380183(v=vs.85)">SpShutdown</a> function.
     * @type {Pointer<Ptr>}
     */
    Shutdown {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spgetinfofn">SpGetInfo</a> function.
     * @type {Pointer<Ptr>}
     */
    GetInfo {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spacceptcredentialsfn">SpAcceptCredentials</a> function.
     * @type {Pointer<Ptr>}
     */
    AcceptCredentials {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    AcquireCredentialsHandleA {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    QueryCredentialsAttributesA {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecredentialshandle">FreeCredentialsHandle</a> function.
     * @type {Pointer<Ptr>}
     */
    FreeCredentialsHandle {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spsavecredentialsfn">SpSaveCredentials</a> function.
     * @type {Pointer<Ptr>}
     */
    SaveCredentials {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_credentials">GetCredentials</a> function.
     * @type {Pointer<Ptr>}
     */
    GetCredentials {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spdeletecredentialsfn">SpDeleteCredentials</a> function.
     * @type {Pointer<Ptr>}
     */
    DeleteCredentials {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spinitlsamodecontextfn">SpInitLsaModeContext</a> function.
     * @type {Pointer<Ptr>}
     */
    InitLsaModeContext {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spacceptlsamodecontextfn">SpAcceptLsaModeContext</a> function.
     * @type {Pointer<Ptr>}
     */
    AcceptLsaModeContext {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-kspdeletecontextfn">SpDeleteContext</a> function.
     * @type {Pointer<Ptr>}
     */
    DeleteContext {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-applycontroltoken">ApplyControlToken</a> function.
     * @type {Pointer<Ptr>}
     */
    ApplyControlToken {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spgetuserinfofn">SpGetUserInfo</a> function.
     * @type {Pointer<Ptr>}
     */
    GetUserInfo {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spgetextendedinformationfn">SpGetExtendedInformation
     * </a> function.
     * @type {Pointer<Ptr>}
     */
    GetExtendedInformation {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    QueryContextAttributesA {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    AddCredentialsA {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spsetextendedinformationfn">SpSetExtendedInformation</a> function.
     * @type {Pointer<Ptr>}
     */
    SetExtendedInformation {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    SetContextAttributesA {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    SetCredentialsAttributesA {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ChangeAccountPasswordA {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spquerymetadatafn">QueryMetaData</a> function.
     * @type {Pointer<Ptr>}
     */
    QueryMetaData {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spexchangemetadatafn">ExchangeMetaData</a> function.
     * @type {Pointer<Ptr>}
     */
    ExchangeMetaData {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spgetcreduicontextfn">GetCredUIContext</a> function.
     * @type {Pointer<Ptr>}
     */
    GetCredUIContext {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spupdatecredentialsfn">UpdateCredentials</a> function.
     * @type {Pointer<Ptr>}
     */
    UpdateCredentials {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spvalidatetargetinfofn">SpValidateTargetInfoFn</a> function.
     * @type {Pointer<Ptr>}
     */
    ValidateTargetInfo {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    PostLogonUser {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    GetRemoteCredGuardLogonBuffer {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    GetRemoteCredGuardSupplementalCreds {
        get => NumGet(this, 296, "ptr")
        set => NumPut("ptr", value, this, 296)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    GetTbalSupplementalCreds {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    LogonUserEx3 {
        get => NumGet(this, 312, "ptr")
        set => NumPut("ptr", value, this, 312)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    PreLogonUserSurrogate {
        get => NumGet(this, 320, "ptr")
        set => NumPut("ptr", value, this, 320)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    PostLogonUserSurrogate {
        get => NumGet(this, 328, "ptr")
        set => NumPut("ptr", value, this, 328)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    ExtractTargetInfo {
        get => NumGet(this, 336, "ptr")
        set => NumPut("ptr", value, this, 336)
    }
}
