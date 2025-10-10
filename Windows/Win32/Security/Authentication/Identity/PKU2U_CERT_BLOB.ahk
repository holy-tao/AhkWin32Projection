#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies PKU2U certificate data.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-pku2u_cert_blob
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class PKU2U_CERT_BLOB extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The number of bytes from the beginning of this structure in memory to the beginning of the certificate data.
     * @type {Integer}
     */
    CertOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size, in bytes, of the certificate data.
     * @type {Integer}
     */
    CertLength {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }
}
