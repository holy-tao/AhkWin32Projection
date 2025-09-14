#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used when calling WinVerifyTrust to verify a CERT_CONTEXT.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-wintrust_cert_info
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class WINTRUST_CERT_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Count of bytes in this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * String with the name of the memory object pointed to by the <b>pbMem</b> member of the 
     * [WINTRUST_BLOB_INFO](/windows/desktop/api/wintrust/ns-wintrust-wintrust_blob_info) structure.
     * @type {Pointer<PWSTR>}
     */
    pcwszDisplayName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> to be verified.
     * @type {Pointer<CERT_CONTEXT>}
     */
    psCertContext {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The number of store handles in <b>pahStores</b>.
     * @type {Integer}
     */
    chStores {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * An array of open <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate stores</a> to add to the list of stores that the policy provider looks in to find certificates while building a trust chain.
     * @type {Pointer<HCERTSTORE>}
     */
    pahStores {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * 
     * @type {Pointer<FILETIME>}
     */
    psftVerifyAsOf {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
