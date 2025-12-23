#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a set of bits represented by an array of bytes.
 * @remarks
 * Because the smallest chunk of memory that can normally be allocated is a byte, the <b>CRYPT_BIT_BLOB</b> structure allows the last byte in the array to contain zero to seven unused bits. The number of unused bits in the array is contained  in the <b>cUnusedBits</b> member of this structure. The number of meaningful bits in the <b>pbData</b> member is calculated with the formula ((<b>cbData</b> × 8) –<b>cUnusedBits</b>). For example, if you need to represent 10 bits, you would allocate an array of 2 bytes and set <b>cUnusedBits</b> to 6. If you view the array as contiguous bits from left to right, the left 10 bits would be meaningful, and the right 6 bits would be unused.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_bit_blob
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_BIT_BLOB extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The number of bytes in the <b>pbData</b> array.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an array of bytes that represents the bits.
     * @type {Pointer<Integer>}
     */
    pbData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The number of unused bits in the last byte of the array. The unused bits are always the least significant bits in the last byte of the array.
     * @type {Integer}
     */
    cUnusedBits {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
