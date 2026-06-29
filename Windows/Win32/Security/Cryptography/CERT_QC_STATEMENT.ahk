#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Represents a single statement in a sequence of one or more statements for inclusion in a Qualified Certificate (QC) statements extension.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_qc_statement
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_QC_STATEMENT {
    #StructPack 8

    /**
     * A pointer to a string that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) for the defined statement.
     * 
     * 
     * The Wincrypt.h file defines the following <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifiers</a> (OIDs) for use with this member, but this member can be any OID as required by an application.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_QC_EU_COMPLIANCE"></a><a id="szoid_qc_eu_compliance"></a><a id="SZOID_QC_EU_COMPLIANCE"></a><dl>
     * <dt><b>szOID_QC_EU_COMPLIANCE</b></dt>
     * <dt>"0.4.0.1862.1.1"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * European Union
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_QC_SSCD"></a><a id="szoid_qc_sscd"></a><a id="SZOID_QC_SSCD"></a><dl>
     * <dt><b>szOID_QC_SSCD</b></dt>
     * <dt>"0.4.0.1862.1.4"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Secure Signature Creation Device
     * 
     * </td>
     * </tr>
     * </table>
     */
    pszStatementId : PSTR

    /**
     * An optional <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> that contains additional information that qualifies the defined statement. The <b>pszStatementId</b> member defines the syntax of this parameter.
     */
    StatementInfo : CRYPT_INTEGER_BLOB

}
