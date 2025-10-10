#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the range of key sizes that are supported by the provider.
 * @remarks
 * 
  * The key sizes are given in a range that is inclusive of the minimum and maximum values and are separated by the increment. For example, if the minimum key size is 8 bits, the maximum key size is 16 bits, and the increment is 2 bits, the provider would support key sizes of 8, 10, 12, 14, and 16 bits.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bcrypt/ns-bcrypt-bcrypt_key_lengths_struct
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_KEY_LENGTHS_STRUCT extends Win32Struct
{
    static sizeof => 12

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
}
