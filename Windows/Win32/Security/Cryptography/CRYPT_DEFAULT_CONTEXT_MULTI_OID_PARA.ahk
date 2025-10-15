#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the CryptInstallDefaultContext function to contain an array of object identifier strings.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_default_context_multi_oid_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_DEFAULT_CONTEXT_MULTI_OID_PARA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of elements in the <b>rgpszOID</b> array.
     * @type {Integer}
     */
    cOID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of pointers to null-terminated ANSI strings that contain the object identifier strings of the certificate signature algorithm to install the default provider for, for example, <b>szOID_OIWSEC_md5RSA</b>. The <b>cOID</b> member of this structure contains the number of elements in this array.
     * @type {Pointer<PSTR>}
     */
    rgpszOID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
