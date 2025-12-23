#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CERT_ALT_NAME_INFO.ahk

/**
 * Identifies a location from which the CRL can be obtained.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crl_dist_point_name
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRL_DIST_POINT_NAME extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

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
     * @type {Integer}
     */
    dwDistPointNameChoice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {CERT_ALT_NAME_INFO}
     */
    FullName{
        get {
            if(!this.HasProp("__FullName"))
                this.__FullName := CERT_ALT_NAME_INFO(8, this)
            return this.__FullName
        }
    }
}
