#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Contains information about a service for user (S4U) logon.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_s4u_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_S4U_LOGON extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_logon_submit_type">KERB_LOGON_SUBMIT_TYPE</a> enumeration that identifies the type of logon being requested. This member must be set to <b>KerbS4ULogon</b>.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Flags that provide more information about the logon.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_S4U_LOGON_FLAG_CHECK_LOGONHOURS"></a><a id="kerb_s4u_logon_flag_check_logonhours"></a><dl>
     * <dt><b>KERB_S4U_LOGON_FLAG_CHECK_LOGONHOURS</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requests the hours that the user has been logged on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_S4U_LOGON_FLAG_IDENTIFY"></a><a id="kerb_s4u_logon_flag_identify"></a><dl>
     * <dt><b>KERB_S4U_LOGON_FLAG_IDENTIFY</b></dt>
     * <dt>0x8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requests the identity token.
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN) of the client. This member cannot be <b>NULL</b>.
     * 
     * The <b>Buffer</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure must point to memory that is contiguous to the <b>KERB_S4U_LOGON</b> structure.
     * @type {LSA_UNICODE_STRING}
     */
    ClientUpn{
        get {
            if(!this.HasProp("__ClientUpn"))
                this.__ClientUpn := LSA_UNICODE_STRING(this.ptr + 8)
            return this.__ClientUpn
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that specifies the realm of the client, if known. If the realm is not known, this member can be <b>NULL</b>.
     * 
     * The <b>Buffer</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> structure must point to memory that is contiguous to the <b>KERB_S4U_LOGON</b> structure.
     * @type {LSA_UNICODE_STRING}
     */
    ClientRealm{
        get {
            if(!this.HasProp("__ClientRealm"))
                this.__ClientRealm := LSA_UNICODE_STRING(this.ptr + 24)
            return this.__ClientRealm
        }
    }
}
