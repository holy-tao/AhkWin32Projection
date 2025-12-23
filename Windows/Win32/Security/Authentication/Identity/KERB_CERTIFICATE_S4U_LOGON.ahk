#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Contains information about the certificate for a service for user (S4U) logon.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_certificate_s4u_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_CERTIFICATE_S4U_LOGON extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_logon_submit_type">KERB_LOGON_SUBMIT_TYPE</a> enumeration that identifies the type of logon request being made. This member must be set to <b>KerbCertificateS4ULogon</b>.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Flags that provide more information about the certificate logon.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_CERTIFICATE_S4U_LOGON_FLAG_CHECK_DUPLICATES"></a><a id="kerb_certificate_s4u_logon_flag_check_duplicates"></a><dl>
     * <dt><b>KERB_CERTIFICATE_S4U_LOGON_FLAG_CHECK_DUPLICATES</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/key-distribution-center">Key Distribution Center</a> (KDC) checks for account mapping conflicts for the same certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_CERTIFICATE_S4U_LOGON_FLAG_CHECK_LOGONHOURS"></a><a id="kerb_certificate_s4u_logon_flag_check_logonhours"></a><dl>
     * <dt><b>KERB_CERTIFICATE_S4U_LOGON_FLAG_CHECK_LOGONHOURS</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The KDC checks the length of time this account with this certificate has been logged on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_CERTIFICATE_S4U_LOGON_FLAG_IF_NT_AUTH_POLICY_REQUIRED"></a><a id="kerb_certificate_s4u_logon_flag_if_nt_auth_policy_required"></a><dl>
     * <dt><b>KERB_CERTIFICATE_S4U_LOGON_FLAG_IF_NT_AUTH_POLICY_REQUIRED</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The KDC checks to see if an authentication policy is set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_CERTIFICATE_S4U_LOGON_FLAG_IDENTIFY"></a><a id="kerb_certificate_s4u_logon_flag_identify"></a><dl>
     * <dt><b>KERB_CERTIFICATE_S4U_LOGON_FLAG_IDENTIFY</b></dt>
     * <dt>0x8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The KDC checks for identity only tokens instead of impersonation tokens. The request for the identity token must have the same value as the <b>KERB_S4U_LOGON_FLAG_IDENTIFY</b> flag in the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_s4u_logon">KERB_S4U_LOGON</a> structure.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista with SP2:  </b>This flag is not available.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The user principal name of the client to authenticate. The value of this member can be <b>NULL</b>.   If the value is not <b>NULL</b>, the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a> function uses the value to locate the user name.
     * @type {LSA_UNICODE_STRING}
     */
    UserPrincipalName{
        get {
            if(!this.HasProp("__UserPrincipalName"))
                this.__UserPrincipalName := LSA_UNICODE_STRING(8, this)
            return this.__UserPrincipalName
        }
    }

    /**
     * The domain name of the user to authenticate. The value of this member can be <b>NULL</b>. If the value is not <b>NULL</b>, the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a> function uses the value to locate the KDC. If the value is <b>NULL</b>, the <b>LsaLogonUser</b> function attempts to authenticate against the domain to which the computer is joined.
     * @type {LSA_UNICODE_STRING}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := LSA_UNICODE_STRING(24, this)
            return this.__DomainName
        }
    }

    /**
     * The length, in bytes, of the client certificate.
     * @type {Integer}
     */
    CertificateLength {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The certificate of the S4U logon.
     * @type {Pointer<Integer>}
     */
    Certificate {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
