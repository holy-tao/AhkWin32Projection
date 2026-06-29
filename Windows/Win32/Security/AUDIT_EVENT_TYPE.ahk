#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values that indicate the type of object being audited. The AccessCheckByTypeAndAuditAlarm and AccessCheckByTypeResultListAndAuditAlarm functions use these values.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-audit_event_type
 * @namespace Windows.Win32.Security
 */
export default struct AUDIT_EVENT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
