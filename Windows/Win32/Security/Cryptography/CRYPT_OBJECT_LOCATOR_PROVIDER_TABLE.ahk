#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains pointers to functions implemented by an object location provider.
 * @remarks
 * No pointers in this table can be <b>NULL</b>. The client application does not free this structure. It is expected that the provider will return a table that is not allocated on the heap.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_object_locator_provider_table
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_OBJECT_LOCATOR_PROVIDER_TABLE {
    #StructPack 8

    /**
     * Size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_get">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET</a> function implemented by the provider.
     */
    pfnGet : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_release">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_RELEASE</a>  function implemented by the provider.
     */
    pfnRelease : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free_password">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD</a>  function implemented by the provider.
     */
    pfnFreePassword : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE</a>  function implemented by the provider.
     */
    pfnFree : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free_identifier">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER</a>  function implemented by the provider.
     */
    pfnFreeIdentifier : IntPtr

}
