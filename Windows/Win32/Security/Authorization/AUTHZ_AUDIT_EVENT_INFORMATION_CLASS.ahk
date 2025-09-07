#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUTHZ_AUDIT_EVENT_INFORMATION_CLASS{

    /**
     * @type {Integer (Int32)}
     */
    static AuthzAuditEventInfoFlags => 1

    /**
     * @type {Integer (Int32)}
     */
    static AuthzAuditEventInfoOperationType => 2

    /**
     * @type {Integer (Int32)}
     */
    static AuthzAuditEventInfoObjectType => 3

    /**
     * @type {Integer (Int32)}
     */
    static AuthzAuditEventInfoObjectName => 4

    /**
     * @type {Integer (Int32)}
     */
    static AuthzAuditEventInfoAdditionalInfo => 5
}
