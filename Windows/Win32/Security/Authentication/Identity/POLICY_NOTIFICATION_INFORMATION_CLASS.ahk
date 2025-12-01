#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The POLICY_NOTIFICATION_INFORMATION_CLASS enumeration defines the types of policy information and policy domain information for which your application can request notification of changes.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-policy_notification_information_class
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_NOTIFICATION_INFORMATION_CLASS extends Win32Enum{

    /**
     * Notify when any of the audited categories are changed.
     * @type {Integer (Int32)}
     */
    static PolicyNotifyAuditEventsInformation => 1

    /**
     * Notify when the account domain information changes.
     * @type {Integer (Int32)}
     */
    static PolicyNotifyAccountDomainInformation => 2

    /**
     * Notify when the LSA server changes its role from primary to backup, or vice versa.
     * @type {Integer (Int32)}
     */
    static PolicyNotifyServerRoleInformation => 3

    /**
     * Notify when the DNS domain information changes or if the primary domain information changes.
     * @type {Integer (Int32)}
     */
    static PolicyNotifyDnsDomainInformation => 4

    /**
     * Notify when the Encrypting File System (EFS) domain information changes.
     * @type {Integer (Int32)}
     */
    static PolicyNotifyDomainEfsInformation => 5

    /**
     * Notify when the Kerberos ticket for the domain changes.
     * @type {Integer (Int32)}
     */
    static PolicyNotifyDomainKerberosTicketInformation => 6

    /**
     * Notify when the machine account password changes.
     * @type {Integer (Int32)}
     */
    static PolicyNotifyMachineAccountPasswordInformation => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PolicyNotifyGlobalSaclInformation => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PolicyNotifyMax => 9
}
