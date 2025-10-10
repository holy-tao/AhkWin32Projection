#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Encapsulates an array of certificates for use with Internet Key Exchange messages.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_or_crl_bundle
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_OR_CRL_BUNDLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of items in the array pointed to by the <b>rgItem</b> member.
     * @type {Integer}
     */
    cItem {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an array of certificates.
     * @type {Pointer<CERT_OR_CRL_BLOB>}
     */
    rgItem {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
