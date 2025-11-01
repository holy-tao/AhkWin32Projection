#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a DER-encoded object identifier (OID).
 * @see https://docs.microsoft.com/windows/win32/api//bcrypt/ns-bcrypt-bcrypt_oid
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_OID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size, in bytes, of the <b>pbOID</b> buffer.
     * @type {Integer}
     */
    cbOID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The address of a buffer that contains the OID.
     * @type {Pointer<Integer>}
     */
    pbOID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
