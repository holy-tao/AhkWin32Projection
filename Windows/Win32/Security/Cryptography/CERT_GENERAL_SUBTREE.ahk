#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CERT_ALT_NAME_ENTRY.ahk

/**
 * The CERT_GENERAL_SUBTREE structure is used in CERT_NAME_CONSTRAINTS_INFO structure. This structure provides the identity of a certificate that can be included or excluded.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_general_subtree
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_GENERAL_SUBTREE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_alt_name_entry">CERT_ALT_NAME_ENTRY</a> containing a base name identifier of a certificate.
     * @type {CERT_ALT_NAME_ENTRY}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := CERT_ALT_NAME_ENTRY(0, this)
            return this.__Base
        }
    }

    /**
     * Currently not used.
     * @type {Integer}
     */
    dwMinimum {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Currently not used.
     * @type {BOOL}
     */
    fMaximum {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Currently not used.
     * @type {Integer}
     */
    dwMaximum {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
