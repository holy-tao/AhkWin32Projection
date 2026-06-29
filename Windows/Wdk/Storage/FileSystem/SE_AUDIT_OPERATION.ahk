#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct SE_AUDIT_OPERATION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
