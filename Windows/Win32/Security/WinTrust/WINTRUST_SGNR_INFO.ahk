#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used when calling WinVerifyTrust to verify a CMSG_SIGNER_INFO structure.
 * @see https://docs.microsoft.com/windows/win32/api//wintrust/ns-wintrust-wintrust_sgnr_info
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class WINTRUST_SGNR_INFO extends Win32Struct
{
    static sizeof => 40

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
     * String with the name representing the signer to be checked.
     * @type {PWSTR}
     */
    pcwszDisplayName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_signer_info">CMSG_SIGNER_INFO</a> structure that includes the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">signature</a> to be verified.
     * @type {Pointer<CMSG_SIGNER_INFO>}
     */
    psSignerInfo {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Number of store handles in <b>pahStores</b>.
     * @type {Integer}
     */
    chStores {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * An array of open <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate stores</a> to be added to the list of stores that the policy provider uses to find certificates while building a trust chain.
     * @type {Pointer<HCERTSTORE>}
     */
    pahStores {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
