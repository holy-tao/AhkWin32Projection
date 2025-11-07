#Requires AutoHotkey v2.0.0 64-bit

/**
 * Lists the types of messages that can be sent to the Kerberos authentication package by calling the LsaCallAuthenticationPackage function.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ne-ntsecapi-kerb_protocol_message_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_PROTOCOL_MESSAGE_TYPE{

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static KerbDebugRequestMessage => 0

    /**
     * This dispatch routine returns information about all of the cached tickets for the specified user <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a>.
     * @type {Integer (Int32)}
     */
    static KerbQueryTicketCacheMessage => 1

    /**
     * This constant is reserved.
     * @type {Integer (Int32)}
     */
    static KerbChangeMachinePasswordMessage => 2

    /**
     * This constant is reserved.
     * @type {Integer (Int32)}
     */
    static KerbVerifyPacMessage => 3

    /**
     * This dispatch routine retrieves the ticket-granting ticket from the ticket cache of the specified user logon session.
     * @type {Integer (Int32)}
     */
    static KerbRetrieveTicketMessage => 4

    /**
     * This constant is reserved.
     * @type {Integer (Int32)}
     */
    static KerbUpdateAddressesMessage => 5

    /**
     * This dispatch routine allows selected tickets to be removed from the user logon session's ticket cache. It can also remove all cached tickets.
     * @type {Integer (Int32)}
     */
    static KerbPurgeTicketCacheMessage => 6

    /**
     * This message causes the use of Kerberos Password Change Protocol to change the user's password in a Windows domain or configured non-Windows Kerberos realm that supports this service. The caller must know the current password to change the password for an account. 
     * 
     * 
     * 
     * 
     * When changing the password of an account in a  non-Windows Kerberos realm, the local computer's registry is consulted to locate the Kerberos password service for the requested domain name.
     * @type {Integer (Int32)}
     */
    static KerbChangePasswordMessage => 7

    /**
     * This message retrieves the specified ticket, either from the cache, if it is already there, or by requesting it from the Kerberos key distribution center (KDC).
     * @type {Integer (Int32)}
     */
    static KerbRetrieveEncodedTicketMessage => 8

    /**
     * This constant is reserved.
     * @type {Integer (Int32)}
     */
    static KerbDecryptDataMessage => 9

    /**
     * This constant is reserved.
     * @type {Integer (Int32)}
     */
    static KerbAddBindingCacheEntryMessage => 10

    /**
     * This message uses a modified Kerberos Password Change Protocol to change the user's password in the domain or configured non-Windows Kerberos realm that supports this service. The caller must have permission  to set the password for the target account. The caller does not need to know the current password for the account. 
     * 
     * 
     * 
     * 
     * When changing the password for an account in a  non-Windows Kerberos realm, the local computer registry is used to locate the Kerberos password service for the requested domain name.
     * @type {Integer (Int32)}
     */
    static KerbSetPasswordMessage => 11

    /**
     * This message extends <b>KerbSetPasswordMessage</b> by specifying the client name and realm.
     * @type {Integer (Int32)}
     */
    static KerbSetPasswordExMessage => 12

    /**
     * @type {Integer (Int32)}
     */
    static KerbVerifyCredentialsMessage => 13

    /**
     * This message extends <b>KerbQueryTicketCacheMessage</b> by specifying the client name and realm.
     * @type {Integer (Int32)}
     */
    static KerbQueryTicketCacheExMessage => 14

    /**
     * This message extends <b>KerbPurgeTicketCacheMessage</b> by specifying the client name and realm.
     * @type {Integer (Int32)}
     */
    static KerbPurgeTicketCacheExMessage => 15

    /**
     * This message is a request to refresh the smart card credentials.
     * @type {Integer (Int32)}
     */
    static KerbRefreshSmartcardCredentialsMessage => 16

    /**
     * This message is to add, remove, or replace an extra credential. The <b>SeTcbPrivilege</b> is required to alter another logon account's credentials.
     * @type {Integer (Int32)}
     */
    static KerbAddExtraCredentialsMessage => 17

    /**
     * This constant is reserved.
     * @type {Integer (Int32)}
     */
    static KerbQuerySupplementalCredentialsMessage => 18

    /**
     * The dispatch routine transfers credentials from one <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> to another <b>LUID</b>. The <b>SeTcbPrivilege</b> is required. 
     * 
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * @type {Integer (Int32)}
     */
    static KerbTransferCredentialsMessage => 19

    /**
     * The dispatch routine queries the Kerberos ticket cache for the specified logon session. The session key type and branch ID are returned in addition to the other information returned when using the  <b>KerbQueryTicketCacheMessage</b> message type. The <b>SeTcbPrivilege</b> is required. 
     * 
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * @type {Integer (Int32)}
     */
    static KerbQueryTicketCacheEx2Message => 20

    /**
     * The dispatch routine gets the tickets from the KDC and updates the ticket cache. The <b>SeTcbPrivilege</b> is required to access another logon account's ticket cache. 
     * 
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * @type {Integer (Int32)}
     */
    static KerbSubmitTicketMessage => 21

    /**
     * The dispatch routine adds, modifies, or deletes an extra credential in one or more <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">service principal names</a> (SPNs). The <b>SeTcbPrivilege</b> is required to change extra credentials in another user's logon session.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * @type {Integer (Int32)}
     */
    static KerbAddExtraCredentialsExMessage => 22

    /**
     * This message returned information about the KDC proxy cached tickets.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * @type {Integer (Int32)}
     */
    static KerbQueryKdcProxyCacheMessage => 23

    /**
     * This message allows selected KDC proxy tickets to be removed.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * @type {Integer (Int32)}
     */
    static KerbPurgeKdcProxyCacheMessage => 24

    /**
     * The dispatch routine queries the Kerberos ticket cache for the specified logon session. The number of tickets information is returned in addition to the other information returned when using the  <b>KerbQueryTicketCacheEx2Message</b> message type. The <b>SeTcbPrivilege</b> is required. 
     * 
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * @type {Integer (Int32)}
     */
    static KerbQueryTicketCacheEx3Message => 25

    /**
     * This message is to clean up and remove any PKINIT device credentials from the computer.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * @type {Integer (Int32)}
     */
    static KerbCleanupMachinePkinitCredsMessage => 26

    /**
     * This message is for adding a binding cache entry. The <b>SeTcbPrivilege</b> is required. 
     *  
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * @type {Integer (Int32)}
     */
    static KerbAddBindingCacheEntryExMessage => 27

    /**
     * This message queries the binding cache for the number of entries and their data.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * @type {Integer (Int32)}
     */
    static KerbQueryBindingCacheMessage => 28

    /**
     * This message is to clean up entries in the binding cache.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * @type {Integer (Int32)}
     */
    static KerbPurgeBindingCacheMessage => 29

    /**
     * 
     * @type {Integer (Int32)}
     */
    static KerbPinKdcMessage => 30

    /**
     * 
     * @type {Integer (Int32)}
     */
    static KerbUnpinAllKdcsMessage => 31

    /**
     * This message queries for a list of the extended domain policies.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * @type {Integer (Int32)}
     */
    static KerbQueryDomainExtendedPoliciesMessage => 32

    /**
     * This message queries the proxy cache for the information about a service for user (S4U) logon.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * @type {Integer (Int32)}
     */
    static KerbQueryS4U2ProxyCacheMessage => 33

    /**
     * @type {Integer (Int32)}
     */
    static KerbRetrieveKeyTabMessage => 34

    /**
     * @type {Integer (Int32)}
     */
    static KerbRefreshPolicyMessage => 35

    /**
     * @type {Integer (Int32)}
     */
    static KerbPrintCloudKerberosDebugMessage => 36

    /**
     * @type {Integer (Int32)}
     */
    static KerbNetworkTicketLogonMessage => 37

    /**
     * @type {Integer (Int32)}
     */
    static KerbNlChangeMachinePasswordMessage => 38
}
