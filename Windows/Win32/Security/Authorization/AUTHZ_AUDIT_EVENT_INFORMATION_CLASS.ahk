#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_AUDIT_EVENT_INFORMATION_CLASS {
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
