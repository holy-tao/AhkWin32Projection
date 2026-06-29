#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DSAFIPSVERSION_ENUM.ahk" { DSAFIPSVERSION_ENUM }
#Import ".\HASHALGORITHM_ENUM.ahk" { HASHALGORITHM_ENUM }

/**
 * Contains parameter header information for a Digital Signature Algorithm (DSA) key.
 * @remarks
 * When using this structure in a <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptsetproperty">BCryptSetProperty</a> call, to set the parameters for a DSA key created in a <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptgeneratekeypair">BCryptGenerateKeyPair</a> call, (cbKeyLength*8) must equal the previously set dwLength.
 * 
 * The structure applies to DSA keys that exceed 1024 bits in length but are less than or equal to 3072 bits.
 * 
 * This structure is used as a header for a larger buffer. The DSA parameters blob has the following format in contiguous memory. The Seed, q, Modulus, and Generator are in big-endian format.
 * 
 * 
 * ``` syntax
 * 
 * BCRYPT_DSA_PARAMETER_HEADER_V2
 * Seed[cbSeedLength]      // Big-endian.
 * q[cbGroupSize]          // Big-endian.
 * Modulus[cbKeyLength]    // Big-endian.
 * Generator[cbKeyLength]  // Big-endian.
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_dsa_parameter_header_v2
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_DSA_PARAMETER_HEADER_V2 {
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ne-bcrypt-hashalgorithm_enum">HASHALGORITHM_ENUM</a> enumeration value that specifies the hashing algorithm to use.
     */
    hashAlgorithm : HASHALGORITHM_ENUM

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ne-bcrypt-dsafipsversion_enum">DSAFIPSVERSION_ENUM</a> enumeration value that specifies the Federal Information Processing Standard (FIPS) to apply.
     */
    standardVersion : DSAFIPSVERSION_ENUM

    /**
     * Length of the seed used to generate the prime number <i>q</i> in bytes.
     */
    cbSeedLength : UInt32

    /**
     * Size of the prime number <i>q</i>. Currently, when the key exceeds 1024 bits in length, <i>q</i> is 32 bytes long.
     */
    cbGroupSize : UInt32

    /**
     * The number of iterations performed to generate the prime number q from the seed. For more information, see NIST standard FIPS186-3.
     */
    Count : Int8[4]

}
