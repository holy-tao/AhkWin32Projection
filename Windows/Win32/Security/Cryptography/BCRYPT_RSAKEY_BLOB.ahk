#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used as a header for an RSA public key or private key BLOB in memory.
 * @remarks
 * 
  * This structure is used as a header for a larger buffer. An RSA <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key BLOB</a> (BCRYPT_RSAPUBLIC_BLOB) has the following format in contiguous memory. All of the numbers following the structure are in big-endian format.
  * 
  * <pre class="syntax" xml:space="preserve"><code>
  * BCRYPT_RSAKEY_BLOB
  * PublicExponent[cbPublicExp] // Big-endian.
  * Modulus[cbModulus] // Big-endian.
  * </code></pre>
  * An RSA <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key BLOB</a> (BCRYPT_RSAPRIVATE_BLOB) has the following format in contiguous memory. All of the numbers following the structure are in big-endian format.
  * 
  * <pre class="syntax" xml:space="preserve"><code>
  * BCRYPT_RSAKEY_BLOB
  * PublicExponent[cbPublicExp] // Big-endian.
  * Modulus[cbModulus] // Big-endian.
  * Prime1[cbPrime1] // Big-endian.
  * Prime2[cbPrime2] // Big-endian.
  * </code></pre>
  * A full RSA private key BLOB (BCRYPT_RSAFULLPRIVATE_BLOB) has the following format in contiguous memory. All of the numbers following the structure are in big-endian format.
  * 
  * <pre class="syntax" xml:space="preserve"><code>
  * BCRYPT_RSAKEY_BLOB
  * PublicExponent[cbPublicExp] // Big-endian.
  * Modulus[cbModulus] // Big-endian.
  * Prime1[cbPrime1] // Big-endian.
  * Prime2[cbPrime2] // Big-endian.
  * Exponent1[cbPrime1] // Big-endian.
  * Exponent2[cbPrime2] // Big-endian.
  * Coefficient[cbPrime1] // Big-endian.
  * PrivateExponent[cbModulus] // Big-endian.
  * </code></pre>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bcrypt/ns-bcrypt-bcrypt_rsakey_blob
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_RSAKEY_BLOB extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    Magic {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size, in bits, of the key.
     * @type {Integer}
     */
    BitLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size, in bytes, of the exponent of the key. As of Windows 10 version 1903, public exponents larger than (2^64 - 1) are no longer supported.
     * @type {Integer}
     */
    cbPublicExp {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size, in bytes, of the modulus of the key.
     * @type {Integer}
     */
    cbModulus {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The size, in bytes, of the first prime number of the key. This is only used for private key BLOBs.
     * @type {Integer}
     */
    cbPrime1 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The size, in bytes, of the second prime number of the key. This is only used for private key BLOBs.
     * @type {Integer}
     */
    cbPrime2 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
