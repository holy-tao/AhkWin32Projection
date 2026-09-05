#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Lists the types of messages that can be sent to the Kerberos authentication package by calling the LsaCallAuthenticationPackage function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-kerb_protocol_message_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class KERB_PROTOCOL_MESSAGE_TYPE extends Win32Enum {

    /**
     * Reserved.
     * Native name: KerbDebugRequestMessage
     * @type {Integer (Int32)}
     */
    static DebugRequestMessage => 0

    /**
     * This dispatch routine returns information about all of the cached tickets for the specified user <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a>.
     * Native name: KerbQueryTicketCacheMessage
     * @type {Integer (Int32)}
     */
    static QueryTicketCacheMessage => 1

    /**
     * This constant is reserved.
     * Native name: KerbChangeMachinePasswordMessage
     * @type {Integer (Int32)}
     */
    static ChangeMachinePasswordMessage => 2

    /**
     * This constant is reserved.
     * Native name: KerbVerifyPacMessage
     * @type {Integer (Int32)}
     */
    static VerifyPacMessage => 3

    /**
     * This dispatch routine retrieves the ticket-granting ticket from the ticket cache of the specified user logon session.
     * Native name: KerbRetrieveTicketMessage
     * @type {Integer (Int32)}
     */
    static RetrieveTicketMessage => 4

    /**
     * This constant is reserved.
     * Native name: KerbUpdateAddressesMessage
     * @type {Integer (Int32)}
     */
    static UpdateAddressesMessage => 5

    /**
     * This dispatch routine allows selected tickets to be removed from the user logon session's ticket cache. It can also remove all cached tickets.
     * Native name: KerbPurgeTicketCacheMessage
     * @type {Integer (Int32)}
     */
    static PurgeTicketCacheMessage => 6

    /**
     * This message causes the use of Kerberos Password Change Protocol to change the user's password in a Windows domain or configured non-Windows Kerberos realm that supports this service. The caller must know the current password to change the password for an account. 
     * 
     * 
     * 
     * 
     * When changing the password of an account in a  non-Windows Kerberos realm, the local computer's registry is consulted to locate the Kerberos password service for the requested domain name.
     * Native name: KerbChangePasswordMessage
     * @type {Integer (Int32)}
     */
    static ChangePasswordMessage => 7

    /**
     * This message retrieves the specified ticket, either from the cache, if it is already there, or by requesting it from the Kerberos key distribution center (KDC).
     * Native name: KerbRetrieveEncodedTicketMessage
     * @type {Integer (Int32)}
     */
    static RetrieveEncodedTicketMessage => 8

    /**
     * This constant is reserved.
     * Native name: KerbDecryptDataMessage
     * @type {Integer (Int32)}
     */
    static DecryptDataMessage => 9

    /**
     * This constant is reserved.
     * Native name: KerbAddBindingCacheEntryMessage
     * @type {Integer (Int32)}
     */
    static AddBindingCacheEntryMessage => 10

    /**
     * This message uses a modified Kerberos Password Change Protocol to change the user's password in the domain or configured non-Windows Kerberos realm that supports this service. The caller must have permission  to set the password for the target account. The caller does not need to know the current password for the account. 
     * 
     * 
     * 
     * 
     * When changing the password for an account in a  non-Windows Kerberos realm, the local computer registry is used to locate the Kerberos password service for the requested domain name.
     * Native name: KerbSetPasswordMessage
     * @type {Integer (Int32)}
     */
    static SetPasswordMessage => 11

    /**
     * This message extends <b>KerbSetPasswordMessage</b> by specifying the client name and realm.
     * Native name: KerbSetPasswordExMessage
     * @type {Integer (Int32)}
     */
    static SetPasswordExMessage => 12

    /**
     * Native name: KerbVerifyCredentialsMessage
     * @type {Integer (Int32)}
     */
    static VerifyCredentialsMessage => 13

    /**
     * This message extends <b>KerbQueryTicketCacheMessage</b> by specifying the client name and realm.
     * Native name: KerbQueryTicketCacheExMessage
     * @type {Integer (Int32)}
     */
    static QueryTicketCacheExMessage => 14

    /**
     * This message extends <b>KerbPurgeTicketCacheMessage</b> by specifying the client name and realm.
     * Native name: KerbPurgeTicketCacheExMessage
     * @type {Integer (Int32)}
     */
    static PurgeTicketCacheExMessage => 15

    /**
     * This message is a request to refresh the smart card credentials.
     * Native name: KerbRefreshSmartcardCredentialsMessage
     * @type {Integer (Int32)}
     */
    static RefreshSmartcardCredentialsMessage => 16

    /**
     * This message is to add, remove, or replace an extra credential. The <b>SeTcbPrivilege</b> is required to alter another logon account's credentials.
     * Native name: KerbAddExtraCredentialsMessage
     * @type {Integer (Int32)}
     */
    static AddExtraCredentialsMessage => 17

    /**
     * This constant is reserved.
     * Native name: KerbQuerySupplementalCredentialsMessage
     * @type {Integer (Int32)}
     */
    static QuerySupplementalCredentialsMessage => 18

    /**
     * The dispatch routine transfers credentials from one <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> to another <b>LUID</b>. The <b>SeTcbPrivilege</b> is required. 
     * 
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * Native name: KerbTransferCredentialsMessage
     * @type {Integer (Int32)}
     */
    static TransferCredentialsMessage => 19

    /**
     * The dispatch routine queries the Kerberos ticket cache for the specified logon session. The session key type and branch ID are returned in addition to the other information returned when using the  <b>KerbQueryTicketCacheMessage</b> message type. The <b>SeTcbPrivilege</b> is required. 
     * 
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * Native name: KerbQueryTicketCacheEx2Message
     * @type {Integer (Int32)}
     */
    static QueryTicketCacheEx2Message => 20

    /**
     * The dispatch routine gets the tickets from the KDC and updates the ticket cache. The <b>SeTcbPrivilege</b> is required to access another logon account's ticket cache. 
     * 
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * Native name: KerbSubmitTicketMessage
     * @type {Integer (Int32)}
     */
    static SubmitTicketMessage => 21

    /**
     * The dispatch routine adds, modifies, or deletes an extra credential in one or more <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">service principal names</a> (SPNs). The <b>SeTcbPrivilege</b> is required to change extra credentials in another user's logon session.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * Native name: KerbAddExtraCredentialsExMessage
     * @type {Integer (Int32)}
     */
    static AddExtraCredentialsExMessage => 22

    /**
     * This message returned information about the KDC proxy cached tickets.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * Native name: KerbQueryKdcProxyCacheMessage
     * @type {Integer (Int32)}
     */
    static QueryKdcProxyCacheMessage => 23

    /**
     * This message allows selected KDC proxy tickets to be removed.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * Native name: KerbPurgeKdcProxyCacheMessage
     * @type {Integer (Int32)}
     */
    static PurgeKdcProxyCacheMessage => 24

    /**
     * The dispatch routine queries the Kerberos ticket cache for the specified logon session. The number of tickets information is returned in addition to the other information returned when using the  <b>KerbQueryTicketCacheEx2Message</b> message type. The <b>SeTcbPrivilege</b> is required. 
     * 
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * Native name: KerbQueryTicketCacheEx3Message
     * @type {Integer (Int32)}
     */
    static QueryTicketCacheEx3Message => 25

    /**
     * This message is to clean up and remove any PKINIT device credentials from the computer.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * Native name: KerbCleanupMachinePkinitCredsMessage
     * @type {Integer (Int32)}
     */
    static CleanupMachinePkinitCredsMessage => 26

    /**
     * This message is for adding a binding cache entry. The <b>SeTcbPrivilege</b> is required. 
     *  
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * Native name: KerbAddBindingCacheEntryExMessage
     * @type {Integer (Int32)}
     */
    static AddBindingCacheEntryExMessage => 27

    /**
     * This message queries the binding cache for the number of entries and their data.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * Native name: KerbQueryBindingCacheMessage
     * @type {Integer (Int32)}
     */
    static QueryBindingCacheMessage => 28

    /**
     * This message is to clean up entries in the binding cache.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * Native name: KerbPurgeBindingCacheMessage
     * @type {Integer (Int32)}
     */
    static PurgeBindingCacheMessage => 29

    /**
     * Native name: KerbPinKdcMessage
     * @type {Integer (Int32)}
     */
    static PinKdcMessage => 30

    /**
     * Native name: KerbUnpinAllKdcsMessage
     * @type {Integer (Int32)}
     */
    static UnpinAllKdcsMessage => 31

    /**
     * This message queries for a list of the extended domain policies.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * Native name: KerbQueryDomainExtendedPoliciesMessage
     * @type {Integer (Int32)}
     */
    static QueryDomainExtendedPoliciesMessage => 32

    /**
     * This message queries the proxy cache for the information about a service for user (S4U) logon.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not supported.
     * Native name: KerbQueryS4U2ProxyCacheMessage
     * @type {Integer (Int32)}
     */
    static QueryS4U2ProxyCacheMessage => 33

    /**
     * Native name: KerbRetrieveKeyTabMessage
     * @type {Integer (Int32)}
     */
    static RetrieveKeyTabMessage => 34

    /**
     * Native name: KerbRefreshPolicyMessage
     * @type {Integer (Int32)}
     */
    static RefreshPolicyMessage => 35

    /**
     * Native name: KerbPrintCloudKerberosDebugMessage
     * @type {Integer (Int32)}
     */
    static PrintCloudKerberosDebugMessage => 36

    /**
     * Native name: KerbNetworkTicketLogonMessage
     * @type {Integer (Int32)}
     */
    static NetworkTicketLogonMessage => 37

    /**
     * Native name: KerbNlChangeMachinePasswordMessage
     * @type {Integer (Int32)}
     */
    static NlChangeMachinePasswordMessage => 38
}
