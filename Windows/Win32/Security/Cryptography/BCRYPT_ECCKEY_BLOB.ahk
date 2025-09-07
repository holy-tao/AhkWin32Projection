#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used as a header for an elliptic curve public key or private key BLOB in memory.
 * @remarks
 * This structure is used as a header for a larger buffer. An elliptic curve <a href="https://docs.microsoft.com/windows/win32/secgloss/p-gly">public key BLOB</a> (BCRYPT_ECCPUBLIC_BLOB) has the following format in contiguous memory. The X and Y coordinates are unsigned integers encoded in big-endian format.
  * 
  * ```syntax
  * BCRYPT_ECCKEY_BLOB
  * BYTE X[cbKey] // Big-endian.
  * BYTE Y[cbKey] // Big-endian.
  * ```
  * 
  * An elliptic curve <a href="https://docs.microsoft.com/windows/desktop/secgloss/p-gly">private key BLOB</a> (BCRYPT_ECCPRIVATE_BLOB) has the following format in contiguous memory. The X and Y coordinates and d value are unsigned integers encoded in big-endian format.
  * 
  * ```syntax
  * BCRYPT_ECCKEY_BLOB
  * BYTE X[cbKey] // Big-endian.
  * BYTE Y[cbKey] // Big-endian.
  * BYTE d[cbKey] // Big-endian.
  * ```
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_ecckey_blob
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_ECCKEY_BLOB extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the type of key this BLOB represents. The possible values for this member depend on the type of BLOB this structure represents. The following keys use the NIST 256-bit prime curve defined in FIPS 186-2.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCRYPT_ECDH_PUBLIC_P256_MAGIC"></a><a id="bcrypt_ecdh_public_p256_magic"></a><dl>
     * <dt><b>BCRYPT_ECDH_PUBLIC_P256_MAGIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a 256 bit elliptic curve Diffie-Hellman public key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCRYPT_ECDH_PRIVATE_P256_MAGIC"></a><a id="bcrypt_ecdh_private_p256_magic"></a><dl>
     * <dt><b>BCRYPT_ECDH_PRIVATE_P256_MAGIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a 256 bit elliptic curve Diffie-Hellman private key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCRYPT_ECDH_PUBLIC_P384_MAGIC"></a><a id="bcrypt_ecdh_public_p384_magic"></a><dl>
     * <dt><b>BCRYPT_ECDH_PUBLIC_P384_MAGIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a 384 bit elliptic curve Diffie-Hellman public key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCRYPT_ECDH_PRIVATE_P384_MAGIC"></a><a id="bcrypt_ecdh_private_p384_magic"></a><dl>
     * <dt><b>BCRYPT_ECDH_PRIVATE_P384_MAGIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a 384 bit elliptic curve Diffie-Hellman private key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCRYPT_ECDH_PUBLIC_P521_MAGIC"></a><a id="bcrypt_ecdh_public_p521_magic"></a><dl>
     * <dt><b>BCRYPT_ECDH_PUBLIC_P521_MAGIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a 521 bit elliptic curve Diffie-Hellman public key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCRYPT_ECDH_PRIVATE_P521_MAGIC"></a><a id="bcrypt_ecdh_private_p521_magic"></a><dl>
     * <dt><b>BCRYPT_ECDH_PRIVATE_P521_MAGIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a 521 bit elliptic curve Diffie-Hellman private key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCRYPT_ECDSA_PUBLIC_P256_MAGIC"></a><a id="bcrypt_ecdsa_public_p256_magic"></a><dl>
     * <dt><b>BCRYPT_ECDSA_PUBLIC_P256_MAGIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a 256 bit elliptic curve DSA public key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCRYPT_ECDSA_PRIVATE_P256_MAGIC"></a><a id="bcrypt_ecdsa_private_p256_magic"></a><dl>
     * <dt><b>BCRYPT_ECDSA_PRIVATE_P256_MAGIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a 256 bit elliptic curve DSA private key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCRYPT_ECDSA_PUBLIC_P384_MAGIC"></a><a id="bcrypt_ecdsa_public_p384_magic"></a><dl>
     * <dt><b>BCRYPT_ECDSA_PUBLIC_P384_MAGIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a 384 bit elliptic curve DSA public key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCRYPT_ECDSA_PRIVATE_P384_MAGIC"></a><a id="bcrypt_ecdsa_private_p384_magic"></a><dl>
     * <dt><b>BCRYPT_ECDSA_PRIVATE_P384_MAGIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a 384 bit elliptic curve DSA private key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCRYPT_ECDSA_PUBLIC_P521_MAGIC"></a><a id="bcrypt_ecdsa_public_p521_magic"></a><dl>
     * <dt><b>BCRYPT_ECDSA_PUBLIC_P521_MAGIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a 521 bit elliptic curve DSA public key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCRYPT_ECDSA_PRIVATE_P521_MAGIC"></a><a id="bcrypt_ecdsa_private_p521_magic"></a><dl>
     * <dt><b>BCRYPT_ECDSA_PRIVATE_P521_MAGIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a 521 bit elliptic curve DSA private key.
     * 
     * </td>
     * </tr>
     * </table>
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
