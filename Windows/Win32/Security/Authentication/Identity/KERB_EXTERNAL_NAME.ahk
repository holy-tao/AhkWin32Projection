#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Contains information about an external name.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_external_name
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_EXTERNAL_NAME extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

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
     * @type {Integer}
     */
    NameType {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * Indicates the number of names stored in <b>Names</b>.
     * @type {Integer}
     */
    NameCount {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRINGS</a> containing the names.
     * @type {Array<LSA_UNICODE_STRING>}
     */
    Names{
        get {
            if(!this.HasProp("__NamesProxyArray"))
                this.__NamesProxyArray := Win32FixedArray(this.ptr + 8, 8, LSA_UNICODE_STRING, "")
            return this.__NamesProxyArray
        }
    }
}
