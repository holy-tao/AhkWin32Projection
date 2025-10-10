#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains additional information about a logotype.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_logotype_details
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_LOGOTYPE_DETAILS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The address of a null-terminated Unicode string that contains the Multipurpose Internet Mail Extensions (MIME) type of the logotype.
     * @type {Pointer<Char>}
     */
    pwszMimeType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of elements in the <b>rgHashedUrl</b> array.
     * @type {Integer}
     */
    cHashedUrl {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_hashed_url">CERT_HASHED_URL</a> structures that contain the hashed URLs of the logotype. The <b>cHashedUrl</b> member contains the number of elements in this array.
     * @type {Pointer<CERT_HASHED_URL>}
     */
    rgHashedUrl {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
