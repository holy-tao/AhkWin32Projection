#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains logotype reference information.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_logotype_reference
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_LOGOTYPE_REFERENCE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of elements in the <b>rgHashedUrl</b> array.
     * @type {Integer}
     */
    cHashedUrl {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_hashed_url">CERT_HASHED_URL</a> structures that contain the hashed URL of the logotype. The <b>cHashedUrl</b> member contains the number of elements in this array.
     * @type {Pointer<CERT_HASHED_URL>}
     */
    rgHashedUrl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
