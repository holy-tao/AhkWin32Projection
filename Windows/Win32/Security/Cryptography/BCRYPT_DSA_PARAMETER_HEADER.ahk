#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class BCRYPT_DSA_PARAMETER_HEADER extends Win32Struct
{
    static sizeof => 56

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
     * The number of iterations performed to generate the prime number <i>q</i> from the seed.
     * @type {Array<Byte>}
     */
    Count{
        get {
            if(!this.HasProp("__CountProxyArray"))
                this.__CountProxyArray := Win32FixedArray(this.ptr + 12, 4, Primitive, "char")
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
                this.__SeedProxyArray := Win32FixedArray(this.ptr + 16, 20, Primitive, "char")
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
                this.__qProxyArray := Win32FixedArray(this.ptr + 36, 20, Primitive, "char")
            return this.__qProxyArray
        }
    }
}
