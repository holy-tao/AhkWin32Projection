#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Identifies the algorithm and (optionally) the value of the label for an RSAES-OAEP key encryption.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_psource_algorithm
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_PSOURCE_ALGORITHM {
    #StructPack 8

    /**
     * The address of a null-terminated ANSI string that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) of the algorithm. This can be the following value or any other mask generation function OID.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_RSA_PSPECIFIED"></a><a id="szoid_rsa_pspecified"></a><a id="SZOID_RSA_PSPECIFIED"></a><dl>
     * <dt><b>szOID_RSA_PSPECIFIED</b></dt>
     * <dt>"1.2.840.113549.1.1.9"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RSAES-OAEP label function.
     * 
     * </td>
     * </tr>
     * </table>
     */
    pszObjId : PSTR

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> that contains the label. This member is optional and may contain an empty BLOB.
     */
    EncodingParameters : CRYPT_INTEGER_BLOB

}
