#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about an external name.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_external_name
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_EXTERNAL_NAME {
    #StructPack 8

    /**
     * Indicates the type of the names stored in this structure.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KRB_NT_UNKNOWN"></a><a id="krb_nt_unknown"></a><dl>
     * <dt><b>KRB_NT_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown name type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KRB_NT_PRINCIPAL"></a><a id="krb_nt_principal"></a><dl>
     * <dt><b>KRB_NT_PRINCIPAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Name of the user or a Kerberos name type principal in the case of a DCE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KRB_NT_SRV_INST"></a><a id="krb_nt_srv_inst"></a><dl>
     * <dt><b>KRB_NT_SRV_INST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Service name and other unique name as instance (krbtgt).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KRB_NT_SRV_HST"></a><a id="krb_nt_srv_hst"></a><dl>
     * <dt><b>KRB_NT_SRV_HST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Service name with host name as instance (telnet, rcommands).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KRB_NT_SRV_XHST"></a><a id="krb_nt_srv_xhst"></a><dl>
     * <dt><b>KRB_NT_SRV_XHST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Service name with host as instance other than krbtgt, telnet, or rcommands.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KRB_NT_UID"></a><a id="krb_nt_uid"></a><dl>
     * <dt><b>KRB_NT_UID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unique ID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KRB_NT_ENTERPRISE_PRINCIPAL"></a><a id="krb_nt_enterprise_principal"></a><dl>
     * <dt><b>KRB_NT_ENTERPRISE_PRINCIPAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User principal name (UPN) or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">service principal name</a> (SPN).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KRB_NT_ENT_PRINCIPAL_AND_ID"></a><a id="krb_nt_ent_principal_and_id"></a><dl>
     * <dt><b>KRB_NT_ENT_PRINCIPAL_AND_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * UPN and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KRB_NT_MS_PRINICPAL"></a><a id="krb_nt_ms_prinicpal"></a><dl>
     * <dt><b>KRB_NT_MS_PRINICPAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows NT 4.0–style name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KRB_NT_MS_PRINCIPAL_AND_ID"></a><a id="krb_nt_ms_principal_and_id"></a><dl>
     * <dt><b>KRB_NT_MS_PRINCIPAL_AND_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows NT 4.0–style name with SID.
     * 
     * </td>
     * </tr>
     * </table>
     */
    NameType : Int16

    /**
     * Indicates the number of names stored in <b>Names</b>.
     */
    NameCount : UInt16

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRINGS</a> containing the names.
     */
    Names : LSA_UNICODE_STRING[1]

}
