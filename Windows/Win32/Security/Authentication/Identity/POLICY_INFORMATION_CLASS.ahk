#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate the type of information to set or query in a Policy object.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-policy_information_class
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class POLICY_INFORMATION_CLASS extends Win32Enum {

    /**
     * This value is obsolete.
     * Native name: PolicyAuditLogInformation
     * @type {Integer (Int32)}
     */
    static AuditLogInformation => 1

    /**
     * Query or set the auditing rules of the system. You can enable or disable auditing and specify the types of events that are audited. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-policy_audit_events_info">POLICY_AUDIT_EVENTS_INFO</a> structure.
     * Native name: PolicyAuditEventsInformation
     * @type {Integer (Int32)}
     */
    static AuditEventsInformation => 2

    /**
     * This value is obsolete. Use the <b>PolicyDnsDomainInformation</b> value instead.
     * Native name: PolicyPrimaryDomainInformation
     * @type {Integer (Int32)}
     */
    static PrimaryDomainInformation => 3

    /**
     * This value is obsolete.
     * Native name: PolicyPdAccountInformation
     * @type {Integer (Int32)}
     */
    static PdAccountInformation => 4

    /**
     * Query or set the name and SID of the account domain of the system. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-policy_account_domain_info">POLICY_ACCOUNT_DOMAIN_INFO</a> structure.
     * Native name: PolicyAccountDomainInformation
     * @type {Integer (Int32)}
     */
    static AccountDomainInformation => 5

    /**
     * Query or set the role of an LSA server. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-policy_lsa_server_role_info">POLICY_LSA_SERVER_ROLE_INFO</a> structure.
     * Native name: PolicyLsaServerRoleInformation
     * @type {Integer (Int32)}
     */
    static LsaServerRoleInformation => 6

    /**
     * This value is obsolete.
     * Native name: PolicyReplicaSourceInformation
     * @type {Integer (Int32)}
     */
    static ReplicaSourceInformation => 7

    /**
     * This value is obsolete.
     * Native name: PolicyDefaultQuotaInformation
     * @type {Integer (Int32)}
     */
    static DefaultQuotaInformation => 8

    /**
     * Query or set information about the creation time and last modification of the LSA database. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-policy_modification_info">POLICY_MODIFICATION_INFO</a> structure.
     * Native name: PolicyModificationInformation
     * @type {Integer (Int32)}
     */
    static ModificationInformation => 9

    /**
     * This value is obsolete.
     * Native name: PolicyAuditFullSetInformation
     * @type {Integer (Int32)}
     */
    static AuditFullSetInformation => 10

    /**
     * This value is obsolete.
     * Native name: PolicyAuditFullQueryInformation
     * @type {Integer (Int32)}
     */
    static AuditFullQueryInformation => 11

    /**
     * Query or set Domain Name System (DNS) information about the account domain associated with a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-policy_dns_domain_info">POLICY_DNS_DOMAIN_INFO</a> structure.
     * Native name: PolicyDnsDomainInformation
     * @type {Integer (Int32)}
     */
    static DnsDomainInformation => 12

    /**
     * Native name: PolicyDnsDomainInformationInt
     * @type {Integer (Int32)}
     */
    static DnsDomainInformationInt => 13

    /**
     * Native name: PolicyLocalAccountDomainInformation
     * @type {Integer (Int32)}
     */
    static LocalAccountDomainInformation => 14

    /**
     * Native name: PolicyMachineAccountInformation
     * @type {Integer (Int32)}
     */
    static MachineAccountInformation => 15

    /**
     * Native name: PolicyMachineAccountInformation2
     * @type {Integer (Int32)}
     */
    static MachineAccountInformation2 => 16

    /**
     * Native name: PolicyLastEntry
     * @type {Integer (Int32)}
     */
    static LastEntry => 17
}
