#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Lists the types of messages that can be sent to the MSV1_0 Authentication Package by calling the LsaCallAuthenticationPackage function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-msv1_0_protocol_message_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_PROTOCOL_MESSAGE_TYPE extends Win32Enum{

    /**
     * This dispatch routine serves as the first half of an NTLM version 2.0 protocol logon. The challenge returned by this call may be delivered to the initiating NTLM 2.0 node. When that node responds with a challenge response, a <b>MsV1_0Lm20Logon</b> message to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a> function is used to complete the logon. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_logon_submit_type">MSV1_0_LOGON_SUBMIT_TYPE</a>.
     * @type {Integer (Int32)}
     */
    static MsV1_0Lm20ChallengeRequest => 0

    /**
     * This dispatch routine is used by the NTLM redirector to determine the challenge response to pass to a server when trying to establish a connection to the server. 
     * 
     * 
     * 
     * 
     * This routine is passed a challenge from the server. It then encrypts the challenge with either the specified password or with the password implied by the specified <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon identifier</a>. Two challenge responses are returned. One is based on the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> password as given to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">authentication package</a>. The other is based on that password converted to a multiple-byte character set (for example, ASCII) and uppercase. The redirector should use either (or both) formats of challenge responses as it needs them. The redirector should use the returned challenge responses exactly as returned. No zero byte should be added. A challenge response is binary data and might contain zero bytes within the string.
     * 
     * This routine may indicate that a <b>NULL</b> session is to be used. If the redirector specifies all the RETURN_PRIMARY_DOMAINNAME, RETURN_PRIMARY_USERNAME, and USE_PRIMARY_PASSWORD flags, and the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon ID</a> does not correspond to any interactive <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a>, this function returns an empty string for the user name and both challenge responses.
     * @type {Integer (Int32)}
     */
    static MsV1_0Lm20GetChallengeResponse => 1

    /**
     * This value is obsolete.
     * @type {Integer (Int32)}
     */
    static MsV1_0EnumerateUsers => 2

    /**
     * This value is obsolete.
     * @type {Integer (Int32)}
     */
    static MsV1_0GetUserInfo => 3

    /**
     * This value is not supported.
     * @type {Integer (Int32)}
     */
    static MsV1_0ReLogonUsers => 4

    /**
     * This dispatch routine changes the password of an account.
     * @type {Integer (Int32)}
     */
    static MsV1_0ChangePassword => 5

    /**
     * This dispatch routine changes a password in the logon cache. This is used when the password is changed on the domain controller using some other mechanism and the locally cached version needs to be updated to match the new value. For example, RAS handles changing the passwords on the domain but then needs to update the cached copy so the user can still access servers.
     * @type {Integer (Int32)}
     */
    static MsV1_0ChangeCachedPassword => 6

    /**
     * This dispatch routine passes any of the other dispatch routines to the domain controller. The authentication package on the domain controller may choose to reject certain dispatch requests.
     * @type {Integer (Int32)}
     */
    static MsV1_0GenericPassthrough => 7

    /**
     * This dispatch routine caches logon information in the logon cache.
     * @type {Integer (Int32)}
     */
    static MsV1_0CacheLogon => 8

    /**
     * This dispatch routine is called to submit a buffer to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">subauthentication package</a>. If the subauthentication is local, use this dispatch routine. If the subauthentication needs to be processed on the domain controller, use the <b>MsV1_0GenericPassthrough</b> dispatch routine with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-msv1_0_subauth_request">MSV1_0_SUBAUTH_REQUEST</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-msv1_0_subauth_response">MSV1_0_SUBAUTH_RESPONSE</a> buffers.
     * @type {Integer (Int32)}
     */
    static MsV1_0SubAuth => 9

    /**
     * This dispatch routine gets the <b>HMAC_SHA1</b> hash of the  one-way function password of the current logon session.
     * @type {Integer (Int32)}
     */
    static MsV1_0DeriveCredential => 10

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static MsV1_0CacheLookup => 11

    /**
     * This dispatch routine sets the password policy. The <b>SeTcbPrivilege</b> is required.
     * @type {Integer (Int32)}
     */
    static MsV1_0SetProcessOption => 12

    /**
     * This dispatch routine adds, deletes, or enumerates registered local aliases. The caller must be a service to use this message type.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static MsV1_0ConfigLocalAliases => 13

    /**
     * This dispatch routine clears the credentials in the local NTLM logon cache. The <b>SeTcbPrivilege</b> is required.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static MsV1_0ClearCachedCredentials => 14

    /**
     * This dispatch routine looks up the authentication  token. The <b>SeTcbPrivilege</b> is required.
     * 
     * <b>Windows Server 2003 with SP2, Windows Vista, Windows Server 2003 and Windows XP:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static MsV1_0LookupToken => 15

    /**
     * This dispatch routine  validates the logon authentication. The <b>SeTcbPrivilege</b> is required.
     * 
     * <b>Windows Server 2008, Windows Vista with SP1, Windows Server 2003 with SP2, Windows Vista, Windows Server 2003 and Windows XP:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static MsV1_0ValidateAuth => 16

    /**
     * This dispatch routine  looks up the local logon in the cache. The <b>SeTcbPrivilege</b> is required.
     * 
     * <b>Windows Server 2008, Windows Vista with SP1, Windows Server 2003 with SP2, Windows Vista, Windows Server 2003 and Windows XP:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static MsV1_0CacheLookupEx => 17

    /**
     * This dispatch routine  gets the credential key of the authentication packet. The <b>SeTcbPrivilege</b> is required.
     * 
     * <b>Windows Server 2008, Windows Vista with SP1, Windows Server 2003 with SP2, Windows Vista, Windows Server 2003 and Windows XP:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static MsV1_0GetCredentialKey => 18

    /**
     * This dispatch routine sets the features and permissions on  the calling thread. Thread options take precedence over process options and should be used in place of NTLM process options. The <b>SeTcbPrivilege</b> is required.
     * 
     * <b>Windows Server 2008, Windows Vista with SP1, Windows Server 2003 with SP2, Windows Vista, Windows Server 2003 and Windows XP:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static MsV1_0SetThreadOption => 19

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MsV1_0DecryptDpapiMasterKey => 20

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MsV1_0GetStrongCredentialKey => 21

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MsV1_0TransferCred => 22

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MsV1_0ProvisionTbal => 23

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MsV1_0DeleteTbalSecrets => 24
}
