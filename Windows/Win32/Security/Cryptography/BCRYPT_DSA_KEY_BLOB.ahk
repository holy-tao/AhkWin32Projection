#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_DSA_MAGIC.ahk" { BCRYPT_DSA_MAGIC }

/**
 * Used as a header for a Digital Signature Algorithm (DSA) public key or private key BLOB in memory. (BCRYPT_DSA_KEY_BLOB)
 * @remarks
 * The structure applies to DSA keys that equal or exceed 512 bits in length but are less than or equal to 1024 bits.
 * 
 * This structure is used as a header for a larger buffer. A DSA <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key BLOB</a> (BCRYPT_DSA_PUBLIC_BLOB) has the following format in contiguous memory. The Modulus, Generator, and Public numbers are in big-endian format.
 * 
 * 
 * ``` syntax
 * 
 * BCRYPT_DSA_KEY_BLOB
 * Modulus[cbKey]    // Big-endian.
 * Generator[cbKey]  // Big-endian.
 * Public[cbKey]     // Big-endian.
 * 
 * ```
 * 
 * A DSA <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key BLOB</a> (BCRYPT_DSA_PRIVATE_BLOB) has the following format in contiguous memory. The Modulus, Generator, Public, and PrivateExponent numbers are in big-endian format.
 * 
 * 
 * ``` syntax
 * 
 * BCRYPT_DSA_KEY_BLOB
 * Modulus[cbKey]        // Big-endian.
 * Generator[cbKey]      // Big-endian.
 * Public[cbKey]         // Big-endian.
 * PrivateExponent[20]   // Big-endian.
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_dsa_key_blob
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_DSA_KEY_BLOB {
    #StructPack 4

    dwMagic : BCRYPT_DSA_MAGIC

    /**
     * The length, in bytes, of the key.
     */
    cbKey : UInt32

    /**
     * The number of iterations, in big-endian format, used to generate <i>q</i>.
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
