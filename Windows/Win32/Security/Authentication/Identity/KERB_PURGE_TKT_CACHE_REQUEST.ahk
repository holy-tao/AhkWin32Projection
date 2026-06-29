#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * Contains information used to delete entries from the ticket cache.
 * @remarks
 * If both <b>ServerName</b> and <b>RealmName</b> are of zero length, <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> will delete all tickets for the logon session identified by <b>LogonId</b>. Otherwise, <b>LsaCallAuthenticationPackage</b> will search the cache tickets for <b>ServerName</b>@<b>RealmName</b>, and will delete all such tickets.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> does not return this buffer. It returns STATUS_SUCCESS if one or more tickets are deleted. If no tickets are found, the function returns SEC_E_NO_CREDENTIALS.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_purge_tkt_cache_request
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_PURGE_TKT_CACHE_REQUEST {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_protocol_message_type">KERB_PROTOCOL_MESSAGE_TYPE</a> value identifying the type of request being made. This member must be set to <b>KerbPurgeTicketCacheMessage</b>.
     */
    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> structure containing the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a> identifier. This can be zero for the current user's logon session. If not zero, the caller must have the SeTcbPrivilege privilege set. If this fails, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a> authentication package sets the <i>ProtocolStatus</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> to <b>STATUS_ACCESS_DENIED</b>.
     */
    LogonId : LUID

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the name of the service whose tickets should be deleted from the cache.
     */
    ServerName : LSA_UNICODE_STRING

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the name of the realm whose tickets should be deleted from the cache.
     */
    RealmName : LSA_UNICODE_STRING

}
