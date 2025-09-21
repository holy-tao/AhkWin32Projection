#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains pointers to the LSA functions that a security package can call. The Local Security Authority (LSA) passes this structure to a security package when it calls the package's SpInitialize function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-lsa_secpkg_function_table
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_SECPKG_FUNCTION_TABLE extends Win32Struct
{
    static sizeof => 512

    static packingSize => 8

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_create_logon_session">CreateLogonSession</a> function.
     * @type {Pointer<PLSA_CREATE_LOGON_SESSION>}
     */
    CreateLogonSession {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_delete_logon_session">DeleteLogonSession</a> function.
     * @type {Pointer<PLSA_DELETE_LOGON_SESSION>}
     */
    DeleteLogonSession {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_add_credential">AddCredential</a> function.
     * @type {Pointer<PLSA_ADD_CREDENTIAL>}
     */
    AddCredential {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_credentials">GetCredentials</a> function.
     * @type {Pointer<PLSA_GET_CREDENTIALS>}
     */
    GetCredentials {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_delete_credential">DeleteCredential</a> function.
     * @type {Pointer<PLSA_DELETE_CREDENTIAL>}
     */
    DeleteCredential {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_lsa_heap">AllocateLsaHeap</a> function.
     * @type {Pointer<PLSA_ALLOCATE_LSA_HEAP>}
     */
    AllocateLsaHeap {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntlsa/nc-ntlsa-lsa_free_lsa_heap">FreeLsaHeap</a> function.
     * @type {Pointer<PLSA_FREE_LSA_HEAP>}
     */
    FreeLsaHeap {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_client_buffer">AllocateClientBuffer</a> function.
     * @type {Pointer<PLSA_ALLOCATE_CLIENT_BUFFER>}
     */
    AllocateClientBuffer {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_free_client_buffer">FreeClientBuffer</a> function.
     * @type {Pointer<PLSA_FREE_CLIENT_BUFFER>}
     */
    FreeClientBuffer {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_copy_to_client_buffer">CopyToClientBuffer</a> function.
     * @type {Pointer<PLSA_COPY_TO_CLIENT_BUFFER>}
     */
    CopyToClientBuffer {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_copy_from_client_buffer">CopyFromClientBuffer</a> function.
     * @type {Pointer<PLSA_COPY_FROM_CLIENT_BUFFER>}
     */
    CopyFromClientBuffer {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa375494(v=vs.85)">ImpersonateClient</a> function.
     * @type {Pointer<PLSA_IMPERSONATE_CLIENT>}
     */
    ImpersonateClient {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380520(v=vs.85)">UnloadPackage</a> function.
     * @type {Pointer<PLSA_UNLOAD_PACKAGE>}
     */
    UnloadPackage {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_duplicate_handle">DuplicateHandle</a>  function.
     * @type {Pointer<PLSA_DUPLICATE_HANDLE>}
     */
    DuplicateHandle {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Pointer to the <b>SaveSupplementalCredentials</b>  function.
     * @type {Pointer<PLSA_SAVE_SUPPLEMENTAL_CREDENTIALS>}
     */
    SaveSupplementalCredentials {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_create_thread">CreateThread</a>  function.
     * @type {Pointer<PLSA_CREATE_THREAD>}
     */
    CreateThread {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_client_info">GetClientInfo</a>  function.
     * @type {Pointer<PLSA_GET_CLIENT_INFO>}
     */
    GetClientInfo {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_register_notification">RegisterNotification</a>  function.
     * @type {Pointer<PLSA_REGISTER_NOTIFICATION>}
     */
    RegisterNotification {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_cancel_notification">CancelNotification</a> function.
     * @type {Pointer<PLSA_CANCEL_NOTIFICATION>}
     */
    CancelNotification {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_map_buffer">MapBuffer</a>  function.
     * @type {Pointer<PLSA_MAP_BUFFER>}
     */
    MapBuffer {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_create_token">CreateToken</a> function.
     * @type {Pointer<PLSA_CREATE_TOKEN>}
     */
    CreateToken {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * Pointer to the   <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_audit_logon">AuditLogon</a> function.
     * @type {Pointer<PLSA_AUDIT_LOGON>}
     */
    AuditLogon {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_call_package">CallPackage</a>  function.
     * @type {Pointer<PLSA_CALL_PACKAGE>}
     */
    CallPackage {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_free_lsa_heap">FreeReturnBuffer</a> function.
     * @type {Pointer<PLSA_FREE_LSA_HEAP>}
     */
    FreeReturnBuffer {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_call_info">GetCallInfo</a> function.
     * @type {Pointer<PLSA_GET_CALL_INFO>}
     */
    GetCallInfo {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_call_packageex">CallPackageEx</a>  function.
     * @type {Pointer<PLSA_CALL_PACKAGEEX>}
     */
    CallPackageEx {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_create_shared_memory">CreateSharedMemory</a>  function.
     * @type {Pointer<PLSA_CREATE_SHARED_MEMORY>}
     */
    CreateSharedMemory {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * Pointer to the   <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_shared_memory">AllocateSharedMemory</a> function.
     * @type {Pointer<PLSA_ALLOCATE_SHARED_MEMORY>}
     */
    AllocateSharedMemory {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_free_shared_memory">FreeSharedMemory</a>  function.
     * @type {Pointer<PLSA_FREE_SHARED_MEMORY>}
     */
    FreeSharedMemory {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_delete_shared_memory">DeleteSharedMemory</a>  function.
     * @type {Pointer<PLSA_DELETE_SHARED_MEMORY>}
     */
    DeleteSharedMemory {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_open_sam_user">OpenSamUser</a>  function.
     * @type {Pointer<PLSA_OPEN_SAM_USER>}
     */
    OpenSamUser {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * Pointer to the  <b>GetUserCredentials</b> function.
     * @type {Pointer<PLSA_GET_USER_CREDENTIALS>}
     */
    GetUserCredentials {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_user_auth_data">GetUserAuthData</a> function.
     * @type {Pointer<PLSA_GET_USER_AUTH_DATA>}
     */
    GetUserAuthData {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_close_sam_user">CloseSamUser</a> function.
     * @type {Pointer<PLSA_CLOSE_SAM_USER>}
     */
    CloseSamUser {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_convert_auth_data_to_token">ConvertAuthDataToToken</a> function.
     * @type {Pointer<PLSA_CONVERT_AUTH_DATA_TO_TOKEN>}
     */
    ConvertAuthDataToToken {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_client_callback">ClientCallback</a> function.
     * @type {Pointer<PLSA_CLIENT_CALLBACK>}
     */
    ClientCallback {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_update_primary_credentials">UpdateCredentials</a> function.
     * @type {Pointer<PLSA_UPDATE_PRIMARY_CREDENTIALS>}
     */
    UpdateCredentials {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_auth_data_for_user">GetAuthDataForUser</a> function.
     * @type {Pointer<PLSA_GET_AUTH_DATA_FOR_USER>}
     */
    GetAuthDataForUser {
        get => NumGet(this, 296, "ptr")
        set => NumPut("ptr", value, this, 296)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_crack_single_name">CrackSingleName</a> function.
     * @type {Pointer<PLSA_CRACK_SINGLE_NAME>}
     */
    CrackSingleName {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_audit_account_logon">AuditAccountLogon</a> function.
     * @type {Pointer<PLSA_AUDIT_ACCOUNT_LOGON>}
     */
    AuditAccountLogon {
        get => NumGet(this, 312, "ptr")
        set => NumPut("ptr", value, this, 312)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_call_package_passthrough">CallPackagePassthrough</a> function.
     * @type {Pointer<PLSA_CALL_PACKAGE_PASSTHROUGH>}
     */
    CallPackagePassthrough {
        get => NumGet(this, 320, "ptr")
        set => NumPut("ptr", value, this, 320)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-credreadfn">CrediRead</a> function.
     * @type {Pointer<CredReadFn>}
     */
    CrediRead {
        get => NumGet(this, 328, "ptr")
        set => NumPut("ptr", value, this, 328)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-credreaddomaincredentialsfn">CrediReadDomainCredentials</a> function.
     * @type {Pointer<CredReadDomainCredentialsFn>}
     */
    CrediReadDomainCredentials {
        get => NumGet(this, 336, "ptr")
        set => NumPut("ptr", value, this, 336)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-credfreecredentialsfn">CrediFreeCredentials</a> function.
     * @type {Pointer<CredFreeCredentialsFn>}
     */
    CrediFreeCredentials {
        get => NumGet(this, 344, "ptr")
        set => NumPut("ptr", value, this, 344)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_protect_memory">LsaProtectMemory</a> function.
     * @type {Pointer<PLSA_PROTECT_MEMORY>}
     */
    LsaProtectMemory {
        get => NumGet(this, 352, "ptr")
        set => NumPut("ptr", value, this, 352)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff714510(v=vs.85)">LsaUnprotectMemory</a> function.
     * @type {Pointer<PLSA_PROTECT_MEMORY>}
     */
    LsaUnprotectMemory {
        get => NumGet(this, 360, "ptr")
        set => NumPut("ptr", value, this, 360)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_open_token_by_logon_id">OpenTokenByLogonId</a> function.
     * @type {Pointer<PLSA_OPEN_TOKEN_BY_LOGON_ID>}
     */
    OpenTokenByLogonId {
        get => NumGet(this, 368, "ptr")
        set => NumPut("ptr", value, this, 368)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_expand_auth_data_for_domain">ExpandAuthDataForDomain</a> function.
     * @type {Pointer<PLSA_EXPAND_AUTH_DATA_FOR_DOMAIN>}
     */
    ExpandAuthDataForDomain {
        get => NumGet(this, 376, "ptr")
        set => NumPut("ptr", value, this, 376)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_private_heap">AllocatePrivateHeap</a> function.
     * @type {Pointer<PLSA_ALLOCATE_PRIVATE_HEAP>}
     */
    AllocatePrivateHeap {
        get => NumGet(this, 384, "ptr")
        set => NumPut("ptr", value, this, 384)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_free_private_heap">FreePrivateHeap</a> function.
     * @type {Pointer<PLSA_FREE_PRIVATE_HEAP>}
     */
    FreePrivateHeap {
        get => NumGet(this, 392, "ptr")
        set => NumPut("ptr", value, this, 392)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_create_token_ex">CreateTokenEx</a> function.
     * @type {Pointer<PLSA_CREATE_TOKEN_EX>}
     */
    CreateTokenEx {
        get => NumGet(this, 400, "ptr")
        set => NumPut("ptr", value, this, 400)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-credwritefn">CrediWrite</a> function.
     * @type {Pointer<CredWriteFn>}
     */
    CrediWrite {
        get => NumGet(this, 408, "ptr")
        set => NumPut("ptr", value, this, 408)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-crediunmarshalanddecodestringfn">CrediUnmarshalandDecodeString</a> function.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     * @type {Pointer<CrediUnmarshalandDecodeStringFn>}
     */
    CrediUnmarshalandDecodeString {
        get => NumGet(this, 416, "ptr")
        set => NumPut("ptr", value, this, 416)
    }

    /**
     * Introduced in Windows 8 and above for internal Microsoft use only.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     * @type {Pointer<PLSA_PROTECT_MEMORY>}
     */
    DummyFunction6 {
        get => NumGet(this, 424, "ptr")
        set => NumPut("ptr", value, this, 424)
    }

    /**
     * Pointer to the <b>GetExtendedCallFlags</b> function.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     * @type {Pointer<PLSA_GET_EXTENDED_CALL_FLAGS>}
     */
    GetExtendedCallFlags {
        get => NumGet(this, 432, "ptr")
        set => NumPut("ptr", value, this, 432)
    }

    /**
     * Pointer to the <b>DuplicateTokenHandle</b> function.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     * @type {Pointer<PLSA_DUPLICATE_HANDLE>}
     */
    DuplicateTokenHandle {
        get => NumGet(this, 440, "ptr")
        set => NumPut("ptr", value, this, 440)
    }

    /**
     * Pointer to the <b>GetServiceAccountPassword</b> function.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     * @type {Pointer<PLSA_GET_SERVICE_ACCOUNT_PASSWORD>}
     */
    GetServiceAccountPassword {
        get => NumGet(this, 448, "ptr")
        set => NumPut("ptr", value, this, 448)
    }

    /**
     * Introduced in Windows 8 and above for internal Microsoft use only.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     * @type {Pointer<PLSA_PROTECT_MEMORY>}
     */
    DummyFunction7 {
        get => NumGet(this, 456, "ptr")
        set => NumPut("ptr", value, this, 456)
    }

    /**
     * Pointer to the <b>AuditLogonEx</b> function.
     * @type {Pointer<PLSA_AUDIT_LOGON_EX>}
     */
    AuditLogonEx {
        get => NumGet(this, 464, "ptr")
        set => NumPut("ptr", value, this, 464)
    }

    /**
     * Pointer to the <b>CheckProtectedUserByToken</b> function.
     * @type {Pointer<PLSA_CHECK_PROTECTED_USER_BY_TOKEN>}
     */
    CheckProtectedUserByToken {
        get => NumGet(this, 472, "ptr")
        set => NumPut("ptr", value, this, 472)
    }

    /**
     * Pointer to the <b>QueryClientRequest</b> function.
     * @type {Pointer<PLSA_QUERY_CLIENT_REQUEST>}
     */
    QueryClientRequest {
        get => NumGet(this, 480, "ptr")
        set => NumPut("ptr", value, this, 480)
    }

    /**
     * Pointer to the <b>GetAppModeInfo</b> function.
     * @type {Pointer<PLSA_GET_APP_MODE_INFO>}
     */
    GetAppModeInfo {
        get => NumGet(this, 488, "ptr")
        set => NumPut("ptr", value, this, 488)
    }

    /**
     * Pointer to the <b>SetAppModeInfo</b> function.
     * @type {Pointer<PLSA_SET_APP_MODE_INFO>}
     */
    SetAppModeInfo {
        get => NumGet(this, 496, "ptr")
        set => NumPut("ptr", value, this, 496)
    }

    /**
     * @type {Pointer<PLSA_GET_CLIENT_INFO_EX>}
     */
    GetClientInfoEx {
        get => NumGet(this, 504, "ptr")
        set => NumPut("ptr", value, this, 504)
    }
}
