#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Identifies the algorithm and (optionally) the value of the label for an RSAES-OAEP key encryption.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_psource_algorithm
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_PSOURCE_ALGORITHM extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

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
     * @type {PSTR}
     */
    pszObjId{
        get {
            if(!this.HasProp("__pszObjId"))
                this.__pszObjId := PSTR(this.ptr + 0)
            return this.__pszObjId
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> that contains the label. This member is optional and may contain an empty BLOB.
     * @type {CRYPT_INTEGER_BLOB}
     */
    EncodingParameters{
        get {
            if(!this.HasProp("__EncodingParameters"))
                this.__EncodingParameters := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__EncodingParameters
        }
    }
}
