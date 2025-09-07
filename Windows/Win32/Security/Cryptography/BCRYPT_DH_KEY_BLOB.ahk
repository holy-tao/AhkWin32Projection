#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class BCRYPT_DH_KEY_BLOB extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    dwMagic {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The length, in bytes, of the key.
     * @type {Integer}
     */
    cbKey {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
