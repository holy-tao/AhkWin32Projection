#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\LUID.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\Credentials\SecHandle.ahk

/**
 * Contains information used to retrieve a ticket.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-kerb_retrieve_tkt_request
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_RETRIEVE_TKT_REQUEST extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_protocol_message_type">KERB_PROTOCOL_MESSAGE_TYPE</a> value indicating the type of request being made. This member must be set to <b>KerbRetrieveEncodedTicketMessage</b>.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> structure containing the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a> identifier. This can be zero for the current user's logon session. If not zero, the caller must have the SeTcbPrivilege privilege set. If this fails, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a> authentication package sets the <i>ProtocolStatus</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> to STATUS_ACCESS_DENIED.
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(8, this)
            return this.__LogonId
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the name of the target service.
     * @type {LSA_UNICODE_STRING}
     */
    TargetName{
        get {
            if(!this.HasProp("__TargetName"))
                this.__TargetName := LSA_UNICODE_STRING(16, this)
            return this.__TargetName
        }
    }

    /**
     * Contains flags specifying uses for the retrieved ticket. If <b>TicketFlags</b> is set to zero and if there is a matching ticket found in the cache, then that ticket will be returned, regardless of its flag values. If there is no match in the cache, a new ticket with the default flag values will be requested. 
     * 
     * 
     * 
     * 
     * If this member is not set to zero, the returned ticket will not be cached.
     * @type {Integer}
     */
    TicketFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Indicates options for searching the cache. Set this member to zero to indicate that the cache should be searched and if no ticket if found, a new ticket should be requested. 
     * 
     * 
     * 
     * 
     * If this member is not set to zero, the returned ticket will not be cached.
     * 
     * <b>CacheOptions</b> can contain the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_RETRIEVE_TICKET_DONT_USE_CACHE"></a><a id="kerb_retrieve_ticket_dont_use_cache"></a><dl>
     * <dt><b>KERB_RETRIEVE_TICKET_DONT_USE_CACHE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Always request a new ticket; do not search the cache. 
     * 
     * 
     * 
     * 
     * If a ticket is obtained, the Kerberos authentication package returns STATUS_SUCCESS in the <i>ProtocolStatus</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_RETRIEVE_TICKET_USE_CREDHANDLE"></a><a id="kerb_retrieve_ticket_use_credhandle"></a><dl>
     * <dt><b>KERB_RETRIEVE_TICKET_USE_CREDHANDLE</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the <b>CredentialsHandle</b> member instead of <b>LogonId</b> to identify the logon session. The credential handle is used as the client credential for which the ticket is retrieved
     * 
     * <b>Note</b>  This option is not available for 32-bit Windows-based applications running on 64-bit Windows.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_RETRIEVE_TICKET_USE_CACHE_ONLY"></a><a id="kerb_retrieve_ticket_use_cache_only"></a><dl>
     * <dt><b>KERB_RETRIEVE_TICKET_USE_CACHE_ONLY</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return only a previously cached ticket. 
     * 
     * 
     * 
     * 
     * If such a ticket is not found, the Kerberos authentication package returns STATUS_OBJECT_NAME_NOT_FOUND in the <i>ProtocolStatus</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_RETRIEVE_TICKET_AS_KERB_CRED"></a><a id="kerb_retrieve_ticket_as_kerb_cred"></a><dl>
     * <dt><b>KERB_RETRIEVE_TICKET_AS_KERB_CRED</b></dt>
     * <dt>8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return the ticket as a Kerberos credential. The Kerberos ticket is defined in Internet <a href="http://www.ietf.org/rfc/rfc4120.txt">RFC 4120</a> as KRB_CRED. For more information, see <a href="https://www.ietf.org/">http://www.ietf.org</a>. 
     * 
     * 
     * 
     * 							
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_RETRIEVE_TICKET_WITH_SEC_CRED"></a><a id="kerb_retrieve_ticket_with_sec_cred"></a><dl>
     * <dt><b>KERB_RETRIEVE_TICKET_WITH_SEC_CRED</b></dt>
     * <dt>10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_RETRIEVE_TICKET_CACHE_TICKET"></a><a id="kerb_retrieve_ticket_cache_ticket"></a><dl>
     * <dt><b>KERB_RETRIEVE_TICKET_CACHE_TICKET</b></dt>
     * <dt>20</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return the ticket that is currently in the cache. If the ticket is not in the cache, it is requested and then cached. This flag should not be used with the KERB_RETRIEVE_TICKET_DONT_USE_CACHE flag. 
     * 
     * 
     * 
     * 
     * <b>Windows XP with SP1 and earlier and Windows Server 2003:  </b>This option is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_RETRIEVE_TICKET_MAX_LIFETIME"></a><a id="kerb_retrieve_ticket_max_lifetime"></a><dl>
     * <dt><b>KERB_RETRIEVE_TICKET_MAX_LIFETIME</b></dt>
     * <dt>40</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return a fresh ticket with maximum allowed time by the policy. The ticker is cached afterwards. Use of this flag implies that KERB_RETRIEVE_TICKET_USE_CACHE_ONLY is not set and KERB_RETRIEVE_TICKET_CACHE_TICKET is set. 
     * 
     * 
     * 
     * 
     * <b>Windows Vista, Windows Server 2008, Windows XP with SP1 and earlier and Windows Server 2003:  </b>This option is not available.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    CacheOptions {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Specifies the type of encryption to use for the requested ticket. If this member is not set to zero, the returned ticket will not be cached.
     * @type {Integer}
     */
    EncryptionType {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * An SSPI credentials handle used in place of a logon session identifier.
     * @type {SecHandle}
     */
    CredentialsHandle{
        get {
            if(!this.HasProp("__CredentialsHandle"))
                this.__CredentialsHandle := SecHandle(48, this)
            return this.__CredentialsHandle
        }
    }
}
