#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DSAFIPSVERSION_ENUM.ahk" { DSAFIPSVERSION_ENUM }
#Import ".\HASHALGORITHM_ENUM.ahk" { HASHALGORITHM_ENUM }
#Import ".\BCRYPT_DSA_MAGIC.ahk" { BCRYPT_DSA_MAGIC }

/**
 * Used as a header for a Digital Signature Algorithm (DSA) public key or private key BLOB in memory. (BCRYPT_DSA_KEY_BLOB_V2)
 * @remarks
 * The structure applies to DSA keys that exceed 1024 bits in length but are less than or equal to 3072 bits.
 * 
 * This structure is used as a header for a larger buffer. A DSA <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key BLOB</a> (BCRYPT_DSA_PUBLIC_BLOB) has the following format in contiguous memory. The Seed, q, Modulus, Generator, and Public numbers are in big-endian format.
 * 
 * 
 * ``` syntax
 * 
 * BCRYPT_DSA_KEY_BLOB_V2
 * Seed[cbSeedLength]  // Big-endian.
 * q[cbGroupSize]      // Big-endian.
 * Modulus[cbKey]      // Big-endian.
 * Generator[cbKey]    // Big-endian.
 * Public[cbKey]       // Big-endian.
 * 
 * ```
 * 
 * A DSA <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key BLOB</a> (BCRYPT_DSA_PRIVATE_BLOB) has the following format in contiguous memory. The Seed, q, Modulus, Generator, Public, and PrivateExponent numbers are in big-endian format.
 * 
 * 
 * ``` syntax
 * 
 * BCRYPT_DSA_KEY_BLOB_V2
 * Seed[cbSeedLength]              // Big-endian.
 * q[cbGroupSize]                  // Big-endian.
 * Modulus[cbKey]                  // Big-endian.
 * Generator[cbKey]                // Big-endian.
 * Public[cbKey]                   // Big-endian.
 * PrivateExponent[cbGroupSize]    // Big-endian.
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_dsa_key_blob_v2
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_DSA_KEY_BLOB_V2 {
    #StructPack 4

    dwMagic : BCRYPT_DSA_MAGIC

    /**
     * The length, in bytes, of the key.
     */
    cbKey : UInt32

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
     * Size of the prime number <i>q</i> in bytes. Currently, when the key exceeds 1024 bits in length, <i>q</i> is 32 bytes long.
     */
    cbGroupSize : UInt32

    /**
     * The number of iterations performed to generate the prime number <i>q</i> from the seed. For more information, see NIST standard FIPS186-3.
     */
    Count : Int8[4]

}
