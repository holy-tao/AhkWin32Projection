#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * Contains information used to query the ticket cache.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_query_tkt_cache_request
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_QUERY_TKT_CACHE_REQUEST {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_protocol_message_type">KERB_PROTOCOL_MESSAGE_TYPE</a> value identifying the type of request being made. This member must be set to <b>KerbQueryTicketCacheMessage</b> or <b>KerbRetrieveTicketMessage</b>. 
     * 
     * 
     * 
     * 
     * If this member is set to <b>KerbQueryTicketCacheMessage</b>, the request is for information about all of the cached tickets for the specified user logon session. If it is set to <b>KerbRetrieveTicketMessage</b>, the request is for the ticket granting ticket from the ticket cache of the specified user logon session.
     */
    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> structure containing the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a> identifier. This can be zero for the current user's logon session. If not zero, the caller must have the SeTcbPrivilege privilege set. If this fails, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a> authentication package sets the <i>ProtocolStatus</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> to STATUS_ACCESS_DENIED.
     */
    LogonId : LUID

}
