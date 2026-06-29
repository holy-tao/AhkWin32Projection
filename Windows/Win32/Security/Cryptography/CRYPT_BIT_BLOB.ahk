#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a set of bits represented by an array of bytes.
 * @remarks
 * Because the smallest chunk of memory that can normally be allocated is a byte, the <b>CRYPT_BIT_BLOB</b> structure allows the last byte in the array to contain zero to seven unused bits. The number of unused bits in the array is contained  in the <b>cUnusedBits</b> member of this structure. The number of meaningful bits in the <b>pbData</b> member is calculated with the formula ((<b>cbData</b> × 8) –<b>cUnusedBits</b>). For example, if you need to represent 10 bits, you would allocate an array of 2 bytes and set <b>cUnusedBits</b> to 6. If you view the array as contiguous bits from left to right, the left 10 bits would be meaningful, and the right 6 bits would be unused.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_bit_blob
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_BIT_BLOB {
    #StructPack 8

    /**
     * The number of bytes in the <b>pbData</b> array.
     */
    cbData : UInt32

    /**
     * A pointer to an array of bytes that represents the bits.
     */
    pbData : IntPtr

    /**
     * The number of unused bits in the last byte of the array. The unused bits are always the least significant bits in the last byte of the array.
     */
    cUnusedBits : UInt32

}
