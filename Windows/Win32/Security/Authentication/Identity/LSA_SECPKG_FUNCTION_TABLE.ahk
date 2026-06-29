#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
    CreateLogonSession : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_delete_logon_session">DeleteLogonSession</a> function.
     */
    DeleteLogonSession : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_add_credential">AddCredential</a> function.
     */
    AddCredential : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_credentials">GetCredentials</a> function.
     */
    GetCredentials : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_delete_credential">DeleteCredential</a> function.
     */
    DeleteCredential : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_lsa_heap">AllocateLsaHeap</a> function.
     */
    AllocateLsaHeap : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntlsa/nc-ntlsa-lsa_free_lsa_heap">FreeLsaHeap</a> function.
     */
    FreeLsaHeap : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_client_buffer">AllocateClientBuffer</a> function.
     */
    AllocateClientBuffer : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_free_client_buffer">FreeClientBuffer</a> function.
     */
    FreeClientBuffer : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_copy_to_client_buffer">CopyToClientBuffer</a> function.
     */
    CopyToClientBuffer : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_copy_from_client_buffer">CopyFromClientBuffer</a> function.
     */
    CopyFromClientBuffer : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa375494(v=vs.85)">ImpersonateClient</a> function.
     */
    ImpersonateClient : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380520(v=vs.85)">UnloadPackage</a> function.
     */
    UnloadPackage : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_duplicate_handle">DuplicateHandle</a>  function.
     */
    DuplicateHandle : IntPtr

    /**
     * Pointer to the <b>SaveSupplementalCredentials</b>  function.
     */
    SaveSupplementalCredentials : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_create_thread">CreateThread</a>  function.
     */
    CreateThread : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_client_info">GetClientInfo</a>  function.
     */
    GetClientInfo : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_register_notification">RegisterNotification</a>  function.
     */
    RegisterNotification : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_cancel_notification">CancelNotification</a> function.
     */
    CancelNotification : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_map_buffer">MapBuffer</a>  function.
     */
    MapBuffer : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_create_token">CreateToken</a> function.
     */
    CreateToken : IntPtr

    /**
     * Pointer to the   <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_audit_logon">AuditLogon</a> function.
     */
    AuditLogon : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_call_package">CallPackage</a>  function.
     */
    CallPackage : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_free_lsa_heap">FreeReturnBuffer</a> function.
     */
    FreeReturnBuffer : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_call_info">GetCallInfo</a> function.
     */
    GetCallInfo : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_call_packageex">CallPackageEx</a>  function.
     */
    CallPackageEx : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_create_shared_memory">CreateSharedMemory</a>  function.
     */
    CreateSharedMemory : IntPtr

    /**
     * Pointer to the   <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_shared_memory">AllocateSharedMemory</a> function.
     */
    AllocateSharedMemory : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_free_shared_memory">FreeSharedMemory</a>  function.
     */
    FreeSharedMemory : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_delete_shared_memory">DeleteSharedMemory</a>  function.
     */
    DeleteSharedMemory : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_open_sam_user">OpenSamUser</a>  function.
     */
    OpenSamUser : IntPtr

    /**
     * Pointer to the  <b>GetUserCredentials</b> function.
     */
    GetUserCredentials : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_user_auth_data">GetUserAuthData</a> function.
     */
    GetUserAuthData : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_close_sam_user">CloseSamUser</a> function.
     */
    CloseSamUser : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_convert_auth_data_to_token">ConvertAuthDataToToken</a> function.
     */
    ConvertAuthDataToToken : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_client_callback">ClientCallback</a> function.
     */
    ClientCallback : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_update_primary_credentials">UpdateCredentials</a> function.
     */
    UpdateCredentials : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_auth_data_for_user">GetAuthDataForUser</a> function.
     */
    GetAuthDataForUser : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_crack_single_name">CrackSingleName</a> function.
     */
    CrackSingleName : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_audit_account_logon">AuditAccountLogon</a> function.
     */
    AuditAccountLogon : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_call_package_passthrough">CallPackagePassthrough</a> function.
     */
    CallPackagePassthrough : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-credreadfn">CrediRead</a> function.
     */
    CrediRead : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-credreaddomaincredentialsfn">CrediReadDomainCredentials</a> function.
     */
    CrediReadDomainCredentials : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-credfreecredentialsfn">CrediFreeCredentials</a> function.
     */
    CrediFreeCredentials : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_protect_memory">LsaProtectMemory</a> function.
     */
    LsaProtectMemory : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff714510(v=vs.85)">LsaUnprotectMemory</a> function.
     */
    LsaUnprotectMemory : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_open_token_by_logon_id">OpenTokenByLogonId</a> function.
     */
    OpenTokenByLogonId : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_expand_auth_data_for_domain">ExpandAuthDataForDomain</a> function.
     */
    ExpandAuthDataForDomain : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_private_heap">AllocatePrivateHeap</a> function.
     */
    AllocatePrivateHeap : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_free_private_heap">FreePrivateHeap</a> function.
     */
    FreePrivateHeap : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_create_token_ex">CreateTokenEx</a> function.
     */
    CreateTokenEx : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-credwritefn">CrediWrite</a> function.
     */
    CrediWrite : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-crediunmarshalanddecodestringfn">CrediUnmarshalandDecodeString</a> function.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     */
    CrediUnmarshalandDecodeString : IntPtr

    /**
     * Introduced in Windows 8 and above for internal Microsoft use only.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     */
    DummyFunction6 : IntPtr

    /**
     * Pointer to the <b>GetExtendedCallFlags</b> function.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     */
    GetExtendedCallFlags : IntPtr

    /**
     * Pointer to the <b>DuplicateTokenHandle</b> function.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     */
    DuplicateTokenHandle : IntPtr

    /**
     * Pointer to the <b>GetServiceAccountPassword</b> function.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     */
    GetServiceAccountPassword : IntPtr

    /**
     * Introduced in Windows 8 and above for internal Microsoft use only.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This function is not implemented.
     */
    DummyFunction7 : IntPtr

    /**
     * Pointer to the <b>AuditLogonEx</b> function.
     */
    AuditLogonEx : IntPtr

    /**
     * Pointer to the <b>CheckProtectedUserByToken</b> function.
     */
    CheckProtectedUserByToken : IntPtr

    /**
     * Pointer to the <b>QueryClientRequest</b> function.
     */
    QueryClientRequest : IntPtr

    /**
     * Pointer to the <b>GetAppModeInfo</b> function.
     */
    GetAppModeInfo : IntPtr

    /**
     * Pointer to the <b>SetAppModeInfo</b> function.
     */
    SetAppModeInfo : IntPtr

    GetClientInfoEx : IntPtr

    GetSecpkgFailureReason : IntPtr

    SetSecpkgFailureReason : IntPtr

}
