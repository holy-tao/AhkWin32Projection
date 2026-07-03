#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PLSA_ADD_CREDENTIAL.ahk" { PLSA_ADD_CREDENTIAL }
#Import ".\PLSA_ALLOCATE_CLIENT_BUFFER.ahk" { PLSA_ALLOCATE_CLIENT_BUFFER }
#Import ".\PLSA_ALLOCATE_LSA_HEAP.ahk" { PLSA_ALLOCATE_LSA_HEAP }
#Import ".\PLSA_COPY_FROM_CLIENT_BUFFER.ahk" { PLSA_COPY_FROM_CLIENT_BUFFER }
#Import ".\PLSA_COPY_TO_CLIENT_BUFFER.ahk" { PLSA_COPY_TO_CLIENT_BUFFER }
#Import ".\PLSA_CREATE_LOGON_SESSION.ahk" { PLSA_CREATE_LOGON_SESSION }
#Import ".\PLSA_DELETE_CREDENTIAL.ahk" { PLSA_DELETE_CREDENTIAL }
#Import ".\PLSA_DELETE_LOGON_SESSION.ahk" { PLSA_DELETE_LOGON_SESSION }
#Import ".\PLSA_FREE_CLIENT_BUFFER.ahk" { PLSA_FREE_CLIENT_BUFFER }
#Import ".\PLSA_FREE_LSA_HEAP.ahk" { PLSA_FREE_LSA_HEAP }
#Import ".\PLSA_GET_CREDENTIALS.ahk" { PLSA_GET_CREDENTIALS }

/**
 * Contains pointers to the Local Security Authority (LSA) functions that Windows authentication packages can call.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-lsa_dispatch_table
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_DISPATCH_TABLE {
    #StructPack 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_create_logon_session">CreateLogonSession</a> function.
     */
    CreateLogonSession : PLSA_CREATE_LOGON_SESSION

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_delete_logon_session">DeleteLogonSession</a> function.
     */
    DeleteLogonSession : PLSA_DELETE_LOGON_SESSION

    /**
     * Pointer to the 
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_add_credential">AddCredential</a> function.
     */
    AddCredential : PLSA_ADD_CREDENTIAL

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_credentials">GetCredentials</a> function.
     */
    GetCredentials : PLSA_GET_CREDENTIALS

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_delete_credential">DeleteCredential</a> function.
     */
    DeleteCredential : PLSA_DELETE_CREDENTIAL

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_lsa_heap">AllocateLsaHeap</a> function.
     */
    AllocateLsaHeap : PLSA_ALLOCATE_LSA_HEAP

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntlsa/nc-ntlsa-lsa_free_lsa_heap">FreeLsaHeap</a> function.
     */
    FreeLsaHeap : PLSA_FREE_LSA_HEAP

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_client_buffer">AllocateClientBuffer</a> function.
     */
    AllocateClientBuffer : PLSA_ALLOCATE_CLIENT_BUFFER

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_free_client_buffer">FreeClientBuffer</a> function.
     */
    FreeClientBuffer : PLSA_FREE_CLIENT_BUFFER

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_copy_to_client_buffer">CopyToClientBuffer</a>  function.
     */
    CopyToClientBuffer : PLSA_COPY_TO_CLIENT_BUFFER

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_copy_from_client_buffer">CopyFromClientBuffer</a> function.
     */
    CopyFromClientBuffer : PLSA_COPY_FROM_CLIENT_BUFFER

}
