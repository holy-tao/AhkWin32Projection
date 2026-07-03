#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
    CreateLogonSession : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_delete_logon_session">DeleteLogonSession</a> function.
     */
    DeleteLogonSession : IntPtr

    /**
     * Pointer to the 
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_add_credential">AddCredential</a> function.
     */
    AddCredential : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_credentials">GetCredentials</a> function.
     */
    GetCredentials : IntPtr

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_delete_credential">DeleteCredential</a> function.
     */
    DeleteCredential : IntPtr

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_lsa_heap">AllocateLsaHeap</a> function.
     */
    AllocateLsaHeap : IntPtr

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntlsa/nc-ntlsa-lsa_free_lsa_heap">FreeLsaHeap</a> function.
     */
    FreeLsaHeap : IntPtr

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_client_buffer">AllocateClientBuffer</a> function.
     */
    AllocateClientBuffer : IntPtr

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_free_client_buffer">FreeClientBuffer</a> function.
     */
    FreeClientBuffer : IntPtr

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_copy_to_client_buffer">CopyToClientBuffer</a>  function.
     */
    CopyToClientBuffer : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_copy_from_client_buffer">CopyFromClientBuffer</a> function.
     */
    CopyFromClientBuffer : IntPtr

}
