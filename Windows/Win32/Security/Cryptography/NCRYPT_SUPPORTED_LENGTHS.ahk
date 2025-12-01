#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the NCRYPT_LENGTHS_PROPERTY property to contain length information for a key.
 * @see https://learn.microsoft.com/windows/win32/api/ncrypt/ns-ncrypt-ncrypt_supported_lengths
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCRYPT_SUPPORTED_LENGTHS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The minimum length, in bits, of a key.
     * @type {Integer}
     */
    dwMinLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum length, in bits, of a key.
     * @type {Integer}
     */
    dwMaxLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of bits that the key size can be incremented between <b>dwMinLength</b> and <b>dwMaxLength</b>.
     * @type {Integer}
     */
    dwIncrement {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The default length, in bits, of a key.
     * @type {Integer}
     */
    dwDefaultLength {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
