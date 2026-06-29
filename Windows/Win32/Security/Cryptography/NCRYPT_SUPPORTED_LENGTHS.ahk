#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used with the NCRYPT_LENGTHS_PROPERTY property to contain length information for a key.
 * @see https://learn.microsoft.com/windows/win32/api/ncrypt/ns-ncrypt-ncrypt_supported_lengths
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_SUPPORTED_LENGTHS {
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

    /**
     * The default length, in bits, of a key.
     */
    dwDefaultLength : UInt32

}
