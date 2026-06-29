#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information used with szOID_RSA_RC2CBC encryption.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_rc2_cbc_parameters
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_RC2_CBC_PARAMETERS {
    #StructPack 4

    /**
     * Specifies the key length. Current usable key lengths are 40, 64, and 128 bits. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  The numeric value of defined constants for <b>dwVersion</b> are not the same as the key lengths they specified. Currently defined values for <b>dwVersion</b> are shown in the following table.</div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_RC2_40BIT_VERSION"></a><a id="crypt_rc2_40bit_version"></a><dl>
     * <dt><b>CRYPT_RC2_40BIT_VERSION</b></dt>
     * <dt>160</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 40 bits
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_RC2_56BIT_VERSION"></a><a id="crypt_rc2_56bit_version"></a><dl>
     * <dt><b>CRYPT_RC2_56BIT_VERSION</b></dt>
     * <dt>52</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 56 bits
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_RC2_64BIT_VERSION"></a><a id="crypt_rc2_64bit_version"></a><dl>
     * <dt><b>CRYPT_RC2_64BIT_VERSION</b></dt>
     * <dt>120</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 64 bits
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_RC2_128BIT_VERSION"></a><a id="crypt_rc2_128bit_version"></a><dl>
     * <dt><b>CRYPT_RC2_128BIT_VERSION</b></dt>
     * <dt>58</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 128 bits
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwVersion : UInt32

    /**
     * Boolean specifying whether an 8-byte <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">initialization vector</a> (IV) is contained in <b>rgbIV[8]</b>. Set to <b>TRUE</b> when IV is present.
     */
    fIV : BOOL

    /**
     * Eight byte <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">initialization vector</a>. Can be <b>NULL</b> if fIV is <b>FALSE</b>. The IV is encoded as an OCTET_STRING. 
     * 
     * 
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptencodeobject">CryptEncodeObject</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptencodeobjectex">CryptEncodeObjectEx</a> with the <i>dwCertEncodingType</i> parameter set to X500_OCTET_STRING to create the encoded OCTET_STRING. The <b>ContentEncryptionAlgorithm</b>'s <b>Parameters</b> BLOB is updated to point to this encoded OCTET_STRING.
     * 
     * <div class="alert"><b>Note</b>  When a message is decrypted, if it has an IV parameter, the message functions calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptsetkeyparam">CryptSetKeyParam</a> with the IV before doing the decryption.</div>
     * <div> </div>
     */
    rgbIV : Int8[8]

}
