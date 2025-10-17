#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information representing the Netscape certificate sequence of certificates.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_content_info_sequence_of_any
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_CONTENT_INFO_SEQUENCE_OF_ANY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Object identifier (OID) specifying the type of data contained in the <b>rgValue</b> array.
     * @type {PSTR}
     */
    pszObjId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Number of elements in the <b>rgValue</b> array.
     * @type {Integer}
     */
    cValue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Array of pointers to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DER_BLOB</a> structures. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a>.
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    rgValue {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
