#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The POLICY_NOTIFICATION_INFORMATION_CLASS enumeration defines the types of policy information and policy domain information for which your application can request notification of changes.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-policy_notification_information_class
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class POLICY_NOTIFICATION_INFORMATION_CLASS extends Win32Enum {

    /**
     * Notify when any of the audited categories are changed.
     * Native name: PolicyNotifyAuditEventsInformation
     * @type {Integer (Int32)}
     */
    static NotifyAuditEventsInformation => 1

    /**
     * Notify when the account domain information changes.
     * Native name: PolicyNotifyAccountDomainInformation
     * @type {Integer (Int32)}
     */
    static NotifyAccountDomainInformation => 2

    /**
     * Notify when the LSA server changes its role from primary to backup, or vice versa.
     * Native name: PolicyNotifyServerRoleInformation
     * @type {Integer (Int32)}
     */
    static NotifyServerRoleInformation => 3

    /**
     * Notify when the DNS domain information changes or if the primary domain information changes.
     * Native name: PolicyNotifyDnsDomainInformation
     * @type {Integer (Int32)}
     */
    static NotifyDnsDomainInformation => 4

    /**
     * Notify when the Encrypting File System (EFS) domain information changes.
     * Native name: PolicyNotifyDomainEfsInformation
     * @type {Integer (Int32)}
     */
    static NotifyDomainEfsInformation => 5

    /**
     * Notify when the Kerberos ticket for the domain changes.
     * Native name: PolicyNotifyDomainKerberosTicketInformation
     * @type {Integer (Int32)}
     */
    static NotifyDomainKerberosTicketInformation => 6

    /**
     * Notify when the machine account password changes.
     * Native name: PolicyNotifyMachineAccountPasswordInformation
     * @type {Integer (Int32)}
     */
    static NotifyMachineAccountPasswordInformation => 7

    /**
     * Native name: PolicyNotifyGlobalSaclInformation
     * @type {Integer (Int32)}
     */
    static NotifyGlobalSaclInformation => 8

    /**
     * Native name: PolicyNotifyMax
     * @type {Integer (Int32)}
     */
    static NotifyMax => 9
}
