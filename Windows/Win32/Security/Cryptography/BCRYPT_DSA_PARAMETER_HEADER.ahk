#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to contain parameter header information for a Digital Signature Algorithm (DSA) key.
 * @remarks
 * When using this structure in a <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptsetproperty">BCryptSetProperty</a> call, to set the parameters for a DSA key created in a <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptgeneratekeypair">BCryptGenerateKeyPair</a> call, (cbKeyLength*8) must equal the previously set dwLength.
 * 
 * The structure applies to DSA keys that equal or exceed 512 bits in length but are less than or equal to 1024 bits.
 * 
 * This structure is used as a header for a larger buffer. The DSA parameters blob has the following format in contiguous memory. The Modulus and Generator are in big-endian format.
 * 
 * 
 * ``` syntax
 * 
 * BCRYPT_DSA_PARAMETER_HEADER
 * Modulus[cbKeyLength]    // Big-endian.
 * Generator[cbKeyLength]  // Big-endian.
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_dsa_parameter_header
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_DSA_PARAMETER_HEADER {
    #StructPack 4

    /**
     * The total size, in bytes, of this structure and the buffer that immediately follows this structure in memory.
     */
    cbLength : UInt32

    /**
     * The magic value for the key.
     * 
     * 
     * This member must be the following value.
     */
    dwMagic : UInt32

    /**
     * The size, in bytes, of the key that this structure applies to.
     */
    cbKeyLength : UInt32

    /**
     * The number of iterations performed to generate the prime number <i>q</i> from the seed.
     */
    Count : Int8[4]

    /**
     * The seed value, in big-endian format, used to generate <i>q</i>.
     */
    Seed : Int8[20]

    /**
     * The 160-bit prime factor, in big-endian format.
     */
    q : Int8[20]

}
