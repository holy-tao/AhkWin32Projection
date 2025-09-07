#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains pointers to the Local Security Authority (LSA) functions that Windows authentication packages can call.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-lsa_dispatch_table
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_DISPATCH_TABLE extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_create_logon_session">CreateLogonSession</a> function.
     * @type {Pointer<Ptr>}
     */
    CreateLogonSession {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_delete_logon_session">DeleteLogonSession</a> function.
     * @type {Pointer<Ptr>}
     */
    DeleteLogonSession {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the 
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_add_credential">AddCredential</a> function.
     * @type {Pointer<Ptr>}
     */
    AddCredential {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_get_credentials">GetCredentials</a> function.
     * @type {Pointer<Ptr>}
     */
    GetCredentials {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_delete_credential">DeleteCredential</a> function.
     * @type {Pointer<Ptr>}
     */
    DeleteCredential {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_lsa_heap">AllocateLsaHeap</a> function.
     * @type {Pointer<Ptr>}
     */
    AllocateLsaHeap {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntlsa/nc-ntlsa-lsa_free_lsa_heap">FreeLsaHeap</a> function.
     * @type {Pointer<Ptr>}
     */
    FreeLsaHeap {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_client_buffer">AllocateClientBuffer</a> function.
     * @type {Pointer<Ptr>}
     */
    AllocateClientBuffer {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_free_client_buffer">FreeClientBuffer</a> function.
     * @type {Pointer<Ptr>}
     */
    FreeClientBuffer {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Pointer to the
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_copy_to_client_buffer">CopyToClientBuffer</a>  function.
     * @type {Pointer<Ptr>}
     */
    CopyToClientBuffer {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_copy_from_client_buffer">CopyFromClientBuffer</a> function.
     * @type {Pointer<Ptr>}
     */
    CopyFromClientBuffer {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
