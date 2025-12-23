#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate the type of information to set or query in a Policy object.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-policy_information_class
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_INFORMATION_CLASS extends Win32Enum{

    /**
     * This value is obsolete.
     * @type {Integer (Int32)}
     */
    static PolicyAuditLogInformation => 1

    /**
     * Query or set the auditing rules of the system. You can enable or disable auditing and specify the types of events that are audited. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-policy_audit_events_info">POLICY_AUDIT_EVENTS_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static PolicyAuditEventsInformation => 2

    /**
     * This value is obsolete. Use the <b>PolicyDnsDomainInformation</b> value instead.
     * @type {Integer (Int32)}
     */
    static PolicyPrimaryDomainInformation => 3

    /**
     * This value is obsolete.
     * @type {Integer (Int32)}
     */
    static PolicyPdAccountInformation => 4

    /**
     * Query or set the name and SID of the account domain of the system. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-policy_account_domain_info">POLICY_ACCOUNT_DOMAIN_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static PolicyAccountDomainInformation => 5

    /**
     * Query or set the role of an LSA server. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-policy_lsa_server_role_info">POLICY_LSA_SERVER_ROLE_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static PolicyLsaServerRoleInformation => 6

    /**
     * This value is obsolete.
     * @type {Integer (Int32)}
     */
    static PolicyReplicaSourceInformation => 7

    /**
     * This value is obsolete.
     * @type {Integer (Int32)}
     */
    static PolicyDefaultQuotaInformation => 8

    /**
     * Query or set information about the creation time and last modification of the LSA database. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-policy_modification_info">POLICY_MODIFICATION_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static PolicyModificationInformation => 9

    /**
     * This value is obsolete.
     * @type {Integer (Int32)}
     */
    static PolicyAuditFullSetInformation => 10

    /**
     * This value is obsolete.
     * @type {Integer (Int32)}
     */
    static PolicyAuditFullQueryInformation => 11

    /**
     * Query or set Domain Name System (DNS) information about the account domain associated with a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-policy_dns_domain_info">POLICY_DNS_DOMAIN_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static PolicyDnsDomainInformation => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PolicyDnsDomainInformationInt => 13

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PolicyLocalAccountDomainInformation => 14

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PolicyMachineAccountInformation => 15

    /**
     * @type {Integer (Int32)}
     */
    static PolicyMachineAccountInformation2 => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PolicyLastEntry => 17
}
