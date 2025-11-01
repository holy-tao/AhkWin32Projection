#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about groupings of URLs.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_url_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_URL_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in bytes, of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of seconds between synchronizations.
     * @type {Integer}
     */
    dwSyncDeltaTime {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Number of elements in the rgcGroupEntry array of URL groups.
     * @type {Integer}
     */
    cGroup {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Array of URL groups returned.
     * @type {Pointer<Integer>}
     */
    rgcGroupEntry {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 24
    }
}
