#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Provides the payload information of the certificate hash.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-kerb_certificate_hashinfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_CERTIFICATE_HASHINFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Length, in bytes, of the WCHAR string specifying the certificate store name. If <b>StoreNameLength</b> is zero, the "MY" certificate store is implied; otherwise the WCHAR string must immediately follow the <b>KERB_CERTIFICATE_HASHINFO</b> structure in contiguous memory and must include a terminating null character.
     * @type {Integer}
     */
    StoreNameLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Length, in bytes, of the certificate hash. The certificate hash data must follow the <b>KERB_CERTIFICATE_HASHINFO</b> structure and certificate store name (if present) in contiguous memory.
     * @type {Integer}
     */
    HashLength {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
