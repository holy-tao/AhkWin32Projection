#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the range of key sizes that are supported by the provider.
 * @remarks
 * The key sizes are given in a range that is inclusive of the minimum and maximum values and are separated by the increment. For example, if the minimum key size is 8 bits, the maximum key size is 16 bits, and the increment is 2 bits, the provider would support key sizes of 8, 10, 12, 14, and 16 bits.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_key_lengths_struct
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_KEY_LENGTHS_STRUCT {
    #StructPack 4

    /**
     * The minimum length, in bits, of a key.
     */
    dwMinLength : UInt32

    /**
     * The maximum length, in bits, of a key.
     */
    dwMaxLength : UInt32

    /**
     * The number of bits that the key size can be incremented between <b>dwMinLength</b> and <b>dwMaxLength</b>.
     */
    dwIncrement : UInt32

}
