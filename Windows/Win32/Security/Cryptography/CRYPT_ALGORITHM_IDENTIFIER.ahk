#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Specifies an algorithm used to encrypt a private key.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_ALGORITHM_IDENTIFIER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    pszObjId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a>  that provides encoded algorithm-specific parameters. In many cases, there are no parameters. This is indicated by setting the <b>cbData</b> member of the <b>Parameters</b> BLOB to zero. 
     * 
     * 
     * 
     * 
     * The following algorithms have the specified encoded parameters. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/constants-for-cryptencodeobject-and-cryptdecodeobject">Constants for CryptEncodeObject and CryptDecodeObject</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_OIWSEC_dsa"></a><a id="szoid_oiwsec_dsa"></a><a id="SZOID_OIWSEC_DSA"></a><dl>
     * <dt><b>szOID_OIWSEC_dsa</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_dss_parameters">CERT_DSS_PARAMETERS</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_RSA_RC2CBC"></a><a id="szoid_rsa_rc2cbc"></a><a id="SZOID_RSA_RC2CBC"></a><dl>
     * <dt><b>szOID_RSA_RC2CBC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_rc2_cbc_parameters">CRYPT_RC2_CBC_PARAMETERS</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_OIWSEC_desCBC"></a><a id="szoid_oiwsec_descbc"></a><a id="SZOID_OIWSEC_DESCBC"></a><dl>
     * <dt><b>szOID_OIWSEC_desCBC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> that contains an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">initialization vector</a> in the form of an octet string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_RSA_DES_EDE3_CBC"></a><a id="szoid_rsa_des_ede3_cbc"></a><a id="SZOID_RSA_DES_EDE3_CBC"></a><dl>
     * <dt><b>szOID_RSA_DES_EDE3_CBC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> that contains an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">initialization vector</a> in the form of an octet string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_RSA_RC4"></a><a id="szoid_rsa_rc4"></a><a id="SZOID_RSA_RC4"></a><dl>
     * <dt><b>szOID_RSA_RC4</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> that contains an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">initialization vector</a> in the form of an octet string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_RSA_SSA_PSS"></a><a id="szoid_rsa_ssa_pss"></a><a id="SZOID_RSA_SSA_PSS"></a><dl>
     * <dt><b>szOID_RSA_SSA_PSS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_rsa_ssa_pss_parameters">CRYPT_RSA_SSA_PSS_PARAMETERS</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_ECDSA_SPECIFIED"></a><a id="szoid_ecdsa_specified"></a><a id="SZOID_ECDSA_SPECIFIED"></a><dl>
     * <dt><b>szOID_ECDSA_SPECIFIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <b>CRYPT_ALGORITHM_IDENTIFIER</b> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {CRYPT_INTEGER_BLOB}
     */
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__Parameters
        }
    }
}
