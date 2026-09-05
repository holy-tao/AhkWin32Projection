#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class SE_AUDIT_OPERATION extends Win32Enum {

    /**
     * Native name: AuditPrivilegeObject
     * @type {Integer (Int32)}
     */
    static PrivilegeObject => 0

    /**
     * Native name: AuditPrivilegeService
     * @type {Integer (Int32)}
     */
    static PrivilegeService => 1

    /**
     * Native name: AuditAccessCheck
     * @type {Integer (Int32)}
     */
    static AccessCheck => 2

    /**
     * Native name: AuditOpenObject
     * @type {Integer (Int32)}
     */
    static OpenObject => 3

    /**
     * Native name: AuditOpenObjectWithTransaction
     * @type {Integer (Int32)}
     */
    static OpenObjectWithTransaction => 4

    /**
     * Native name: AuditCloseObject
     * @type {Integer (Int32)}
     */
    static CloseObject => 5

    /**
     * Native name: AuditDeleteObject
     * @type {Integer (Int32)}
     */
    static DeleteObject => 6

    /**
     * Native name: AuditOpenObjectForDelete
     * @type {Integer (Int32)}
     */
    static OpenObjectForDelete => 7

    /**
     * Native name: AuditOpenObjectForDeleteWithTransaction
     * @type {Integer (Int32)}
     */
    static OpenObjectForDeleteWithTransaction => 8

    /**
     * Native name: AuditCloseNonObject
     * @type {Integer (Int32)}
     */
    static CloseNonObject => 9

    /**
     * Native name: AuditOpenNonObject
     * @type {Integer (Int32)}
     */
    static OpenNonObject => 10

    /**
     * Native name: AuditObjectReference
     * @type {Integer (Int32)}
     */
    static ObjectReference => 11

    /**
     * Native name: AuditHandleCreation
     * @type {Integer (Int32)}
     */
    static HandleCreation => 12
}
