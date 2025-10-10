#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CERT_RDN structure contains a relative distinguished name (RDN) consisting of an array of CERT_RDN_ATTR structures.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_rdn
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_RDN extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of elements in the <b>rgRDNAttr</b> array.
     * @type {Integer}
     */
    cRDNAttr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_rdn_attr">CERT_RDN_ATTR</a> structures.
     * @type {Pointer<CERT_RDN_ATTR>}
     */
    rgRDNAttr {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
