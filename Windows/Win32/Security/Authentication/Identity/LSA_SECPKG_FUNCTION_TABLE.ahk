#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CredFreeCredentialsFn.ahk" { CredFreeCredentialsFn }
#Import ".\CredReadDomainCredentialsFn.ahk" { CredReadDomainCredentialsFn }
#Import ".\CredReadFn.ahk" { CredReadFn }
#Import ".\CredWriteFn.ahk" { CredWriteFn }
#Import ".\CrediUnmarshalandDecodeStringFn.ahk" { CrediUnmarshalandDecodeStringFn }
#Import ".\PLSA_ADD_CREDENTIAL.ahk" { PLSA_ADD_CREDENTIAL }
#Import ".\PLSA_ALLOCATE_CLIENT_BUFFER.ahk" { PLSA_ALLOCATE_CLIENT_BUFFER }
#Import ".\PLSA_ALLOCATE_LSA_HEAP.ahk" { PLSA_ALLOCATE_LSA_HEAP }
#Import ".\PLSA_ALLOCATE_PRIVATE_HEAP.ahk" { PLSA_ALLOCATE_PRIVATE_HEAP }
#Import ".\PLSA_ALLOCATE_SHARED_MEMORY.ahk" { PLSA_ALLOCATE_SHARED_MEMORY }
#Import ".\PLSA_AUDIT_ACCOUNT_LOGON.ahk" { PLSA_AUDIT_ACCOUNT_LOGON }
#Import ".\PLSA_AUDIT_LOGON.ahk" { PLSA_AUDIT_LOGON }
#Import ".\PLSA_AUDIT_LOGON_EX.ahk" { PLSA_AUDIT_LOGON_EX }
#Import ".\PLSA_CALL_PACKAGE.ahk" { PLSA_CALL_PACKAGE }
#Import ".\PLSA_CALL_PACKAGEEX.ahk" { PLSA_CALL_PACKAGEEX }
#Import ".\PLSA_CALL_PACKAGE_PASSTHROUGH.ahk" { PLSA_CALL_PACKAGE_PASSTHROUGH }
#Import ".\PLSA_CANCEL_NOTIFICATION.ahk" { PLSA_CANCEL_NOTIFICATION }
#Import ".\PLSA_CHECK_PROTECTED_USER_BY_TOKEN.ahk" { PLSA_CHECK_PROTECTED_USER_BY_TOKEN }
#Import ".\PLSA_CLIENT_CALLBACK.ahk" { PLSA_CLIENT_CALLBACK }
#Import ".\PLSA_CLOSE_SAM_USER.ahk" { PLSA_CLOSE_SAM_USER }
#Import ".\PLSA_CONVERT_AUTH_DATA_TO_TOKEN.ahk" { PLSA_CONVERT_AUTH_DATA_TO_TOKEN }
#Import ".\PLSA_COPY_FROM_CLIENT_BUFFER.ahk" { PLSA_COPY_FROM_CLIENT_BUFFER }
#Import ".\PLSA_COPY_TO_CLIENT_BUFFER.ahk" { PLSA_COPY_TO_CLIENT_BUFFER }
#Import ".\PLSA_CRACK_SINGLE_NAME.ahk" { PLSA_CRACK_SINGLE_NAME }
#Import ".\PLSA_CREATE_LOGON_SESSION.ahk" { PLSA_CREATE_LOGON_SESSION }
#Import ".\PLSA_CREATE_SHARED_MEMORY.ahk" { PLSA_CREATE_SHARED_MEMORY }
#Import ".\PLSA_CREATE_THREAD.ahk" { PLSA_CREATE_THREAD }
#Import ".\PLSA_CREATE_TOKEN.ahk" { PLSA_CREATE_TOKEN }
#Import ".\PLSA_CREATE_TOKEN_EX.ahk" { PLSA_CREATE_TOKEN_EX }
#Import ".\PLSA_DELETE_CREDENTIAL.ahk" { PLSA_DELETE_CREDENTIAL }
#Import ".\PLSA_DELETE_LOGON_SESSION.ahk" { PLSA_DELETE_LOGON_SESSION }
#Import ".\PLSA_DELETE_SHARED_MEMORY.ahk" { PLSA_DELETE_SHARED_MEMORY }
#Import ".\PLSA_DUPLICATE_HANDLE.ahk" { PLSA_DUPLICATE_HANDLE }
#Import ".\PLSA_EXPAND_AUTH_DATA_FOR_DOMAIN.ahk" { PLSA_EXPAND_AUTH_DATA_FOR_DOMAIN }
#Import ".\PLSA_FREE_CLIENT_BUFFER.ahk" { PLSA_FREE_CLIENT_BUFFER }
#Import ".\PLSA_FREE_LSA_HEAP.ahk" { PLSA_FREE_LSA_HEAP }
#Import ".\PLSA_FREE_PRIVATE_HEAP.ahk" { PLSA_FREE_PRIVATE_HEAP }
#Import ".\PLSA_FREE_SHARED_MEMORY.ahk" { PLSA_FREE_SHARED_MEMORY }
#Import ".\PLSA_GET_APP_MODE_INFO.ahk" { PLSA_GET_APP_MODE_INFO }
#Import ".\PLSA_GET_AUTH_DATA_FOR_USER.ahk" { PLSA_GET_AUTH_DATA_FOR_USER }
#Import ".\PLSA_GET_CALL_INFO.ahk" { PLSA_GET_CALL_INFO }
#Import ".\PLSA_GET_CLIENT_INFO.ahk" { PLSA_GET_CLIENT_INFO }
#Import ".\PLSA_GET_CLIENT_INFO_EX.ahk" { PLSA_GET_CLIENT_INFO_EX }
#Import ".\PLSA_GET_CREDENTIALS.ahk" { PLSA_GET_CREDENTIALS }
#Import ".\PLSA_GET_EXTENDED_CALL_FLAGS.ahk" { PLSA_GET_EXTENDED_CALL_FLAGS }
#Import ".\PLSA_GET_SECPKG_FAILURE_REASON.ahk" { PLSA_GET_SECPKG_FAILURE_REASON }
#Import ".\PLSA_GET_SERVICE_ACCOUNT_PASSWORD.ahk" { PLSA_GET_SERVICE_ACCOUNT_PASSWORD }
#Import ".\PLSA_GET_USER_AUTH_DATA.ahk" { PLSA_GET_USER_AUTH_DATA }
#Import ".\PLSA_GET_USER_CREDENTIALS.ahk" { PLSA_GET_USER_CREDENTIALS }
#Import ".\PLSA_IMPERSONATE_CLIENT.ahk" { PLSA_IMPERSONATE_CLIENT }
#Import ".\PLSA_MAP_BUFFER.ahk" { PLSA_MAP_BUFFER }
#Import ".\PLSA_OPEN_SAM_USER.ahk" { PLSA_OPEN_SAM_USER }
#Import ".\PLSA_OPEN_TOKEN_BY_LOGON_ID.ahk" { PLSA_OPEN_TOKEN_BY_LOGON_ID }
#Import ".\PLSA_PROTECT_MEMORY.ahk" { PLSA_PROTECT_MEMORY }
#Import ".\PLSA_QUERY_CLIENT_REQUEST.ahk" { PLSA_QUERY_CLIENT_REQUEST }
#Import ".\PLSA_REGISTER_NOTIFICATION.ahk" { PLSA_REGISTER_NOTIFICATION }
#Import ".\PLSA_SAVE_SUPPLEMENTAL_CREDENTIALS.ahk" { PLSA_SAVE_SUPPLEMENTAL_CREDENTIALS }
#Import ".\PLSA_SET_APP_MODE_INFO.ahk" { PLSA_SET_APP_MODE_INFO }
#Import ".\PLSA_SET_SECPKG_FAILURE_REASON.ahk" { PLSA_SET_SECPKG_FAILURE_REASON }
#Import ".\PLSA_UNLOAD_PACKAGE.ahk" { PLSA_UNLOAD_PACKAGE }
#Import ".\PLSA_UPDATE_PRIMARY_CREDENTIALS.ahk" { PLSA_UPDATE_PRIMARY_CREDENTIALS }

/**
 * Contains pointers to the LSA functions that a security package can call. The Local Security Authority (LSA) passes this structure to a security package when it calls the package's SpInitialize function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-lsa_secpkg_function_table
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_SECPKG_FUNCTION_TABLE {
    #StructPack 8

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_create_logon_session">CreateLogonSession</a> function.
     */
    CreateLogonSession : PLSA_CREATE_LOGON_SESSION

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_delete_logon_session">DeleteLogonSession</a> function.
     */
    DeleteLogonSession : PLSA_DELETE_LOGON_SESSION

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_add_credential">AddCredential</a> function.
     */
    AddCredential : PLSA_ADD_CREDENTIAL

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_credentials">GetCredentials</a> function.
     */
    GetCredentials : PLSA_GET_CREDENTIALS

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_delete_credential">DeleteCredential</a> function.
     */
    DeleteCredential : PLSA_DELETE_CREDENTIAL

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_lsa_heap">AllocateLsaHeap</a> function.
     */
    AllocateLsaHeap : PLSA_ALLOCATE_LSA_HEAP

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntlsa/nc-ntlsa-lsa_free_lsa_heap">FreeLsaHeap</a> function.
     */
    FreeLsaHeap : PLSA_FREE_LSA_HEAP

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_client_buffer">AllocateClientBuffer</a> function.
     */
    AllocateClientBuffer : PLSA_ALLOCATE_CLIENT_BUFFER

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_free_client_buffer">FreeClientBuffer</a> function.
     */
    FreeClientBuffer : PLSA_FREE_CLIENT_BUFFER

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_copy_to_client_buffer">CopyToClientBuffer</a> function.
     */
    CopyToClientBuffer : PLSA_COPY_TO_CLIENT_BUFFER

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_copy_from_client_buffer">CopyFromClientBuffer</a> function.
     */
    CopyFromClientBuffer : PLSA_COPY_FROM_CLIENT_BUFFER

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa375494(v=vs.85)">ImpersonateClient</a> function.
     */
    ImpersonateClient : PLSA_IMPERSONATE_CLIENT

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380520(v=vs.85)">UnloadPackage</a> function.
     */
    UnloadPackage : PLSA_UNLOAD_PACKAGE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_duplicate_handle">DuplicateHandle</a>  function.
     */
    DuplicateHandle : PLSA_DUPLICATE_HANDLE

    /**
     * Pointer to the <b>SaveSupplementalCredentials</b>  function.
     */
    SaveSupplementalCredentials : PLSA_SAVE_SUPPLEMENTAL_CREDENTIALS

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_create_thread">CreateThread</a>  function.
     */
    CreateThread : PLSA_CREATE_THREAD

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_client_info">GetClientInfo</a>  function.
     */
    GetClientInfo : PLSA_GET_CLIENT_INFO

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_register_notification">RegisterNotification</a>  function.
     */
    RegisterNotification : PLSA_REGISTER_NOTIFICATION

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_cancel_notification">CancelNotification</a> function.
     */
    CancelNotification : PLSA_CANCEL_NOTIFICATION

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_map_buffer">MapBuffer</a>  function.
     */
    MapBuffer : PLSA_MAP_BUFFER

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_create_token">CreateToken</a> function.
     */
    CreateToken : PLSA_CREATE_TOKEN

    /**
     * Pointer to the   <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_audit_logon">AuditLogon</a> function.
     */
    AuditLogon : PLSA_AUDIT_LOGON

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_call_package">CallPackage</a>  function.
     */
    CallPackage : PLSA_CALL_PACKAGE

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_free_lsa_heap">FreeReturnBuffer</a> function.
     */
    FreeReturnBuffer : PLSA_FREE_LSA_HEAP

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_call_info">GetCallInfo</a> function.
     */
    GetCallInfo : PLSA_GET_CALL_INFO

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_call_packageex">CallPackageEx</a>  function.
     */
    CallPackageEx : PLSA_CALL_PACKAGEEX

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_create_shared_memory">CreateSharedMemory</a>  function.
     */
    CreateSharedMemory : PLSA_CREATE_SHARED_MEMORY

    /**
     * Pointer to the   <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_shared_memory">AllocateSharedMemory</a> function.
     */
    AllocateSharedMemory : PLSA_ALLOCATE_SHARED_MEMORY

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_free_shared_memory">FreeSharedMemory</a>  function.
     */
    FreeSharedMemory : PLSA_FREE_SHARED_MEMORY

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_delete_shared_memory">DeleteSharedMemory</a>  function.
     */
    DeleteSharedMemory : PLSA_DELETE_SHARED_MEMORY

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_open_sam_user">OpenSamUser</a>  function.
     */
    OpenSamUser : PLSA_OPEN_SAM_USER

    /**
     * Pointer to the  <b>GetUserCredentials</b> function.
     */
    GetUserCredentials : PLSA_GET_USER_CREDENTIALS

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_user_auth_data">GetUserAuthData</a> function.
     */
    GetUserAuthData : PLSA_GET_USER_AUTH_DATA

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_close_sam_user">CloseSamUser</a> function.
     */
    CloseSamUser : PLSA_CLOSE_SAM_USER

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_convert_auth_data_to_token">ConvertAuthDataToToken</a> function.
     */
    ConvertAuthDataToToken : PLSA_CONVERT_AUTH_DATA_TO_TOKEN

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_client_callback">ClientCallback</a> function.
     */
    ClientCallback : PLSA_CLIENT_CALLBACK

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_update_primary_credentials">UpdateCredentials</a> function.
     */
    UpdateCredentials : PLSA_UPDATE_PRIMARY_CREDENTIALS

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_auth_data_for_user">GetAuthDataForUser</a> function.
     */
    GetAuthDataForUser : PLSA_GET_AUTH_DATA_FOR_USER

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_crack_single_name">CrackSingleName</a> function.
     */
    CrackSingleName : PLSA_CRACK_SINGLE_NAME

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_audit_account_logon">AuditAccountLogon</a> function.
     */
    AuditAccountLogon : PLSA_AUDIT_ACCOUNT_LOGON

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_call_package_passthrough">CallPackagePassthrough</a> function.
     */
    CallPackagePassthrough : PLSA_CALL_PACKAGE_PASSTHROUGH

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-credreadfn">CrediRead</a> function.
     */
    CrediRead : CredReadFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-credreaddomaincredentialsfn">CrediReadDomainCredentials</a> function.
     */
    CrediReadDomainCredentials : CredReadDomainCredentialsFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-credfreecredentialsfn">CrediFreeCredentials</a> function.
     */
    CrediFreeCredentials : CredFreeCredentialsFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_protect_memory">LsaProtectMemory</a> function.
     */
    LsaProtectMemory : PLSA_PROTECT_MEMORY

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff714510(v=vs.85)">LsaUnprotectMemory</a> function.
     */
    LsaUnprotectMemory : PLSA_PROTECT_MEMORY

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_open_token_by_logon_id">OpenTokenByLogonId</a> function.
     */
    OpenTokenByLogonId : PLSA_OPEN_TOKEN_BY_LOGON_ID

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_expand_auth_data_for_domain">ExpandAuthDataForDomain</a> function.
     */
    ExpandAuthDataForDomain : PLSA_EXPAND_AUTH_DATA_FOR_DOMAIN

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_private_heap">AllocatePrivateHeap</a> function.
     */
    AllocatePrivateHeap : PLSA_ALLOCATE_PRIVATE_HEAP

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_free_private_heap">FreePrivateHeap</a> function.
     */
    FreePrivateHeap : PLSA_FREE_PRIVATE_HEAP

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_create_token_ex">CreateTokenEx</a> function.
     */
    CreateTokenEx : PLSA_CREATE_TOKEN_EX

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-credwritefn">CrediWrite</a> function.
     */
    CrediWrite : CredWriteFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-crediunmarshalanddecodestringfn">CrediUnmarshalandDecodeString</a> function.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     */
    CrediUnmarshalandDecodeString : CrediUnmarshalandDecodeStringFn

    /**
     * Introduced in Windows 8 and above for internal Microsoft use only.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     */
    DummyFunction6 : PLSA_PROTECT_MEMORY

    /**
     * Pointer to the <b>GetExtendedCallFlags</b> function.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     */
    GetExtendedCallFlags : PLSA_GET_EXTENDED_CALL_FLAGS

    /**
     * Pointer to the <b>DuplicateTokenHandle</b> function.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     */
    DuplicateTokenHandle : PLSA_DUPLICATE_HANDLE

    /**
     * Pointer to the <b>GetServiceAccountPassword</b> function.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     */
    GetServiceAccountPassword : PLSA_GET_SERVICE_ACCOUNT_PASSWORD

    /**
     * Introduced in Windows 8 and above for internal Microsoft use only.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     */
    DummyFunction7 : PLSA_PROTECT_MEMORY

    /**
     * Pointer to the <b>AuditLogonEx</b> function.
     */
    AuditLogonEx : PLSA_AUDIT_LOGON_EX

    /**
     * Pointer to the <b>CheckProtectedUserByToken</b> function.
     */
    CheckProtectedUserByToken : PLSA_CHECK_PROTECTED_USER_BY_TOKEN

    /**
     * Pointer to the <b>QueryClientRequest</b> function.
     */
    QueryClientRequest : PLSA_QUERY_CLIENT_REQUEST

    /**
     * Pointer to the <b>GetAppModeInfo</b> function.
     */
    GetAppModeInfo : PLSA_GET_APP_MODE_INFO

    /**
     * Pointer to the <b>SetAppModeInfo</b> function.
     */
    SetAppModeInfo : PLSA_SET_APP_MODE_INFO

    GetClientInfoEx : PLSA_GET_CLIENT_INFO_EX

    GetSecpkgFailureReason : PLSA_GET_SECPKG_FAILURE_REASON

    SetSecpkgFailureReason : PLSA_SET_SECPKG_FAILURE_REASON

}
