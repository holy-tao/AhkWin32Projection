#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_ALT_NAME_ENTRY.ahk" { CERT_ALT_NAME_ENTRY }
#Import ".\CERT_ALT_NAME_INFO.ahk" { CERT_ALT_NAME_INFO }

/**
 * Identifies a location from which the CRL can be obtained.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crl_dist_point_name
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRL_DIST_POINT_NAME {
    #StructPack 8

    /**
     * Indicates the variant used for the name data contained in the union. The following values are defined: 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRL_DIST_POINT_NO_NAME"></a><a id="crl_dist_point_no_name"></a><dl>
     * <dt><b>CRL_DIST_POINT_NO_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No distribution point name is provided.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRL_DIST_POINT_FULL_NAME"></a><a id="crl_dist_point_full_name"></a><dl>
     * <dt><b>CRL_DIST_POINT_FULL_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The distribution point name is in the <b>FullName</b> member of the union.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRL_DIST_POINT_ISSUER_RDN_NAME"></a><a id="crl_dist_point_issuer_rdn_name"></a><dl>
     * <dt><b>CRL_DIST_POINT_ISSUER_RDN_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Currently not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwDistPointNameChoice : UInt32

    FullName : CERT_ALT_NAME_INFO

}
