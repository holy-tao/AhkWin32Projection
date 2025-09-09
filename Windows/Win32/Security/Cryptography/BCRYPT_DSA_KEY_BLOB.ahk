#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class BCRYPT_DSA_KEY_BLOB extends Win32Struct
{
    static sizeof => 52

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

    /**
     * The number of iterations, in big-endian format, used to generate <i>q</i>.
     * @type {Array<Byte>}
     */
    Count{
        get {
            if(!this.HasProp("__CountProxyArray"))
                this.__CountProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "char")
            return this.__CountProxyArray
        }
    }

    /**
     * The seed value, in big-endian format, used to generate <i>q</i>.
     * @type {Array<Byte>}
     */
    Seed{
        get {
            if(!this.HasProp("__SeedProxyArray"))
                this.__SeedProxyArray := Win32FixedArray(this.ptr + 12, 20, Primitive, "char")
            return this.__SeedProxyArray
        }
    }

    /**
     * The 160-bit prime factor, in big-endian format.
     * @type {Array<Byte>}
     */
    q{
        get {
            if(!this.HasProp("__qProxyArray"))
                this.__qProxyArray := Win32FixedArray(this.ptr + 32, 20, Primitive, "char")
            return this.__qProxyArray
        }
    }
}
