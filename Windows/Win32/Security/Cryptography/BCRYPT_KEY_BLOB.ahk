#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is the base structure for all CNG key BLOBs.
 * @see https://docs.microsoft.com/windows/win32/api//bcrypt/ns-bcrypt-bcrypt_key_blob
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_KEY_BLOB extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the type of key this BLOB represents. The possible values for this member depend on the type of BLOB this structure represents.
     * @type {Integer}
     */
    Magic {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
