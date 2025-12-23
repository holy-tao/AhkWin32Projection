#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The POLICY_AUDIT_EVENT_TYPE enumeration defines values that indicate the types of events the system can audit.
 * @remarks
 * The <b>POLICY_AUDIT_EVENT_TYPE</b> enumeration may expand in future versions of Windows. Because of this, you should not compute the number of values in this enumeration directly. Instead, you should obtain the count of values by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaqueryinformationpolicy">LsaQueryInformationPolicy</a> with the <i>InformationClass</i> parameter set to PolicyAuditEventsInformation and extract the count from the <b>MaximumAuditEventCount</b> member of the returned 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-policy_audit_events_info">POLICY_AUDIT_EVENTS_INFO</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-policy_audit_event_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_AUDIT_EVENT_TYPE extends Win32Enum{

    /**
     * Determines whether the operating system must audit any of the following attempts:
     * 
     * <ul>
     * <li>Attempted system time change.</li>
     * <li>Attempted security system startup, restart, or shutdown.</li>
     * <li>Attempt to load extensible authentication features.</li>
     * <li>Loss of audited events due to auditing system failure.</li>
     * <li>Security log size that exceeds a configurable warning threshold level.</li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static AuditCategorySystem => 0

    /**
     * Determines whether the operating system must audit each time this computer validates the credentials of an account. Account logon events are generated whenever a computer validates the credentials of one of its local accounts. The credential validation can be in support of a local logon or, in the case of an Active Directory domain account on a domain controller, can be in support of a logon to another computer. Audited events for local accounts must be logged on the local security log of the computer. Account logoff does not generate an event that can be audited.
     * @type {Integer (Int32)}
     */
    static AuditCategoryLogon => 1

    /**
     * Determines whether the operating system must audit each instance of user attempts to access a non-Active Directory object, such as a file,  that has its own system access control list (SACL) specified. The type of access request, such as Write, Read, or Modify, and the account that is making the request must match the settings in the SACL.
     * @type {Integer (Int32)}
     */
    static AuditCategoryObjectAccess => 2

    /**
     * Determines whether the operating system must audit each instance of user attempts to use  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a>.
     * @type {Integer (Int32)}
     */
    static AuditCategoryPrivilegeUse => 3

    /**
     * Determines whether the operating system must audit specific events, such as program activation, some forms of handle duplication, indirect access to an object, and process exit.
     * @type {Integer (Int32)}
     */
    static AuditCategoryDetailedTracking => 4

    /**
     * Determines whether the operating system must audit attempts to change <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/the-policy-object-type">Policy</a> object rules, such as user rights assignment policy, audit policy, account policy, or trust policy.
     * @type {Integer (Int32)}
     */
    static AuditCategoryPolicyChange => 5

    /**
     * Determines whether the operating system must audit attempts to create, delete, or change user or group accounts. Also, audit password changes.
     * @type {Integer (Int32)}
     */
    static AuditCategoryAccountManagement => 6

    /**
     * Determines whether the operating system must audit attempts to access the directory service. The Active Directory object has its own SACL specified. The type of access request, such as Write, Read, or Modify, and the account that is making the request must match the settings in the SACL.
     * @type {Integer (Int32)}
     */
    static AuditCategoryDirectoryServiceAccess => 7

    /**
     * Determines whether the operating system must audit each instance of a user attempt to log on or log off this computer. Also audits logon attempts by privileged accounts that log on to the domain controller. These audit events are generated when the Kerberos <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Key Distribution Center</a> (KDC) logs on to the domain controller. Logoff attempts are generated whenever the logon session of a logged-on user account is terminated.
     * @type {Integer (Int32)}
     */
    static AuditCategoryAccountLogon => 8
}
