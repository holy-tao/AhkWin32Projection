#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class SE_AUDIT_OPERATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AuditPrivilegeObject => 0

    /**
     * @type {Integer (Int32)}
     */
    static AuditPrivilegeService => 1

    /**
     * @type {Integer (Int32)}
     */
    static AuditAccessCheck => 2

    /**
     * @type {Integer (Int32)}
     */
    static AuditOpenObject => 3

    /**
     * @type {Integer (Int32)}
     */
    static AuditOpenObjectWithTransaction => 4

    /**
     * @type {Integer (Int32)}
     */
    static AuditCloseObject => 5

    /**
     * @type {Integer (Int32)}
     */
    static AuditDeleteObject => 6

    /**
     * @type {Integer (Int32)}
     */
    static AuditOpenObjectForDelete => 7

    /**
     * @type {Integer (Int32)}
     */
    static AuditOpenObjectForDeleteWithTransaction => 8

    /**
     * @type {Integer (Int32)}
     */
    static AuditCloseNonObject => 9

    /**
     * @type {Integer (Int32)}
     */
    static AuditOpenNonObject => 10

    /**
     * @type {Integer (Int32)}
     */
    static AuditObjectReference => 11

    /**
     * @type {Integer (Int32)}
     */
    static AuditHandleCreation => 12
}
