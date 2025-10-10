#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values that indicate the type of object being audited. The AccessCheckByTypeAndAuditAlarm and AccessCheckByTypeResultListAndAuditAlarm functions use these values.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ne-winnt-audit_event_type
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class AUDIT_EVENT_TYPE{

    /**
     * Indicates an object that generates audit messages only if the system administrator has enabled auditing access to files and objects.
     * @type {Integer (Int32)}
     */
    static AuditEventObjectAccess => 0

    /**
     * Indicates a directory service object that generates audit messages only if the system administrator has enabled auditing access to directory service objects.
     * @type {Integer (Int32)}
     */
    static AuditEventDirectoryServiceAccess => 1
}
