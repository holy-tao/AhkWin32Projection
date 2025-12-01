#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class BCRYPT_DSA_KEY_BLOB_V2 extends Win32Struct
{
    static sizeof => 28

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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ne-bcrypt-hashalgorithm_enum">HASHALGORITHM_ENUM</a> enumeration value that specifies the hashing algorithm to use.
     * @type {Integer}
     */
    hashAlgorithm {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ne-bcrypt-dsafipsversion_enum">DSAFIPSVERSION_ENUM</a> enumeration value that specifies the Federal Information Processing Standard (FIPS) to apply.
     * @type {Integer}
     */
    standardVersion {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Length of the seed used to generate the prime number <i>q</i> in bytes.
     * @type {Integer}
     */
    cbSeedLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Size of the prime number <i>q</i> in bytes. Currently, when the key exceeds 1024 bits in length, <i>q</i> is 32 bytes long.
     * @type {Integer}
     */
    cbGroupSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The number of iterations performed to generate the prime number <i>q</i> from the seed. For more information, see NIST standard FIPS186-3.
     * @type {Array<Byte>}
     */
    Count{
        get {
            if(!this.HasProp("__CountProxyArray"))
                this.__CountProxyArray := Win32FixedArray(this.ptr + 24, 4, Primitive, "char")
            return this.__CountProxyArray
        }
    }
}
