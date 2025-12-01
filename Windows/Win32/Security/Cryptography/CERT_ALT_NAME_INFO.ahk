#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CERT_ALT_NAME_INFO structure is used in encoding and decoding extensions for subject or issuer certificates, Certificate Revocation Lists (CRLs), and Certificate Trust Lists (CTLs).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_alt_name_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_ALT_NAME_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of elements in the <b>rgAltEntry</b> array.
     * @type {Integer}
     */
    cAltEntry {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_alt_name_entry">CERT_ALT_NAME_ENTRY</a> structures.
     * @type {Pointer<CERT_ALT_NAME_ENTRY>}
     */
    rgAltEntry {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
