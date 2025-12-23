#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines additional values that can be used when calling the CertCreateContext function.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_create_context_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_CREATE_CONTEXT_PARA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the function that  frees the <i>pbEncoded</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certcreatecontext">CertCreateContext</a> function. The  <b>pfnFree</b> function is called when the context created by  <b>CertCreateContext</b> is freed. This value can be <b>NULL</b>, in which case the <i>pbEncoded</i> parameter of the <b>CertCreateContext</b> function is not freed.
     * @type {Pointer<PFN_CRYPT_FREE>}
     */
    pfnFree {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The address of the memory that gets freed by the <b>pfnFree</b> function. If <b>pvFree</b> is <b>NULL</b>, then the <i>pbEncoded</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certcreatecontext">CertCreateContext</a> function is freed.
     * @type {Pointer<Void>}
     */
    pvFree {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_create_context_sort_func">PFN_CERT_CREATE_CONTEXT_SORT_FUNC</a> function pointer that will be called for each sorted context entry.
     * 
     * This member is only present for a <b>CERT_STORE_CTL_CONTEXT</b> when the <b>CERT_CREATE_CONTEXT_SORTED_FLAG</b> flag is set in the <i>dwFlags</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certcreatecontext">CertCreateContext</a> function. You must verify that this member is present before trying to access it by examining the <b>cbSize</b> member of this structure.
     * @type {Pointer<PFN_CERT_CREATE_CONTEXT_SORT_FUNC>}
     */
    pfnSort {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * An application-defined value that will be passed in the <i>pvSort</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_create_context_sort_func">PFN_CERT_CREATE_CONTEXT_SORT_FUNC</a> callback function.
     * 
     * This member is only present for a <b>CERT_STORE_CTL_CONTEXT</b> when the <b>CERT_CREATE_CONTEXT_SORTED_FLAG</b> flag is set in the <i>dwFlags</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certcreatecontext">CertCreateContext</a> function. You must verify that this member is present before trying to access it by examining the <b>cbSize</b> member of this structure.
     * @type {Pointer<Void>}
     */
    pvSort {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 40
    }
}
