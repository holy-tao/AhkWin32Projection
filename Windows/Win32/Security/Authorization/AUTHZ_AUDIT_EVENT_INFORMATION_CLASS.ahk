#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 */
class AUTHZ_AUDIT_EVENT_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: AuthzAuditEventInfoFlags
     * @type {Integer (Int32)}
     */
    static InfoFlags => 1

    /**
     * Native name: AuthzAuditEventInfoOperationType
     * @type {Integer (Int32)}
     */
    static InfoOperationType => 2

    /**
     * Native name: AuthzAuditEventInfoObjectType
     * @type {Integer (Int32)}
     */
    static InfoObjectType => 3

    /**
     * Native name: AuthzAuditEventInfoObjectName
     * @type {Integer (Int32)}
     */
    static InfoObjectName => 4

    /**
     * Native name: AuthzAuditEventInfoAdditionalInfo
     * @type {Integer (Int32)}
     */
    static InfoAdditionalInfo => 5
}
