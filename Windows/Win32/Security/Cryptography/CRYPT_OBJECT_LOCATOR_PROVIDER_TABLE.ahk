#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains pointers to functions implemented by an object location provider.
 * @remarks
 * No pointers in this table can be <b>NULL</b>. The client application does not free this structure. It is expected that the provider will return a table that is not allocated on the heap.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_object_locator_provider_table
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_OBJECT_LOCATOR_PROVIDER_TABLE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_get">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET</a> function implemented by the provider.
     * @type {Pointer<PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET>}
     */
    pfnGet {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_release">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_RELEASE</a>  function implemented by the provider.
     * @type {Pointer<PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_RELEASE>}
     */
    pfnRelease {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free_password">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD</a>  function implemented by the provider.
     * @type {Pointer<PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD>}
     */
    pfnFreePassword {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE</a>  function implemented by the provider.
     * @type {Pointer<PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE>}
     */
    pfnFree {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free_identifier">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER</a>  function implemented by the provider.
     * @type {Pointer<PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER>}
     */
    pfnFreeIdentifier {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 48
    }
}
