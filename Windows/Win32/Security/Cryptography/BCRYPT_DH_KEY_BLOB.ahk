#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_DH_KEY_BLOB_MAGIC.ahk" { BCRYPT_DH_KEY_BLOB_MAGIC }

/**
 * Used as a header for a Diffie-Hellman public key or private key BLOB in memory.
 * @remarks
 * This structure is used as a header for a larger buffer. A Diffie-Hellman <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key BLOB</a> (BCRYPT_DH_PUBLIC_BLOB) has the following format in contiguous memory. The Modulus, Generator, and Public numbers are in big-endian format.
 * 
 * 
 * ``` syntax
 * 
 * BCRYPT_DH_KEY_BLOB
 * Modulus[cbKey] // Big-endian.
 * Generator[cbKey] // Big-endian.
 * Public[cbKey] // Big-endian.
 * 
 * ```
 * 
 * A Diffie-Hellman <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key BLOB</a> (BCRYPT_DH_PRIVATE_BLOB) has the following format in contiguous memory. The Modulus, Generator, Public, and PrivateExponent numbers are in big-endian format.
 * 
 * 
 * ``` syntax
 * 
 * BCRYPT_DH_KEY_BLOB
 * Modulus[cbKey] // Big-endian.
 * Generator[cbKey] // Big-endian.
 * Public[cbKey] // Big-endian.
 * PrivateExponent[cbKey] // Big-endian.
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_dh_key_blob
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_DH_KEY_BLOB {
    #StructPack 4

    dwMagic : BCRYPT_DH_KEY_BLOB_MAGIC

    /**
     * The length, in bytes, of the key.
     */
    cbKey : UInt32

}
