#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class BCRYPT_DSA_PARAMETER_HEADER_V2 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * The total size, in bytes, of this structure and the buffer that immediately follows this structure in memory.
     * @type {Integer}
     */
    cbLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The magic value for the key.
     * 
     * 
     * This member must be the following value.
     * @type {Integer}
     */
    dwMagic {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size, in bytes, of the key that this structure applies to.
     * @type {Integer}
     */
    cbKeyLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ne-bcrypt-hashalgorithm_enum">HASHALGORITHM_ENUM</a> enumeration value that specifies the hashing algorithm to use.
     * @type {Integer}
     */
    hashAlgorithm {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ne-bcrypt-dsafipsversion_enum">DSAFIPSVERSION_ENUM</a> enumeration value that specifies the Federal Information Processing Standard (FIPS) to apply.
     * @type {Integer}
     */
    standardVersion {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Length of the seed used to generate the prime number <i>q</i> in bytes.
     * @type {Integer}
     */
    cbSeedLength {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Size of the prime number <i>q</i>. Currently, when the key exceeds 1024 bits in length, <i>q</i> is 32 bytes long.
     * @type {Integer}
     */
    cbGroupSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of iterations performed to generate the prime number q from the seed. For more information, see NIST standard FIPS186-3.
     * @type {Array<Byte>}
     */
    Count{
        get {
            if(!this.HasProp("__CountProxyArray"))
                this.__CountProxyArray := Win32FixedArray(this.ptr + 28, 1, Primitive, "char")
            return this.__CountProxyArray
        }
    }
}
