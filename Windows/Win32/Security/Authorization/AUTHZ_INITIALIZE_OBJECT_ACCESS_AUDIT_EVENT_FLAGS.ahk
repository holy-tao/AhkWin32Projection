#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_INITIALIZE_OBJECT_ACCESS_AUDIT_EVENT_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_NO_SUCCESS_AUDIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_NO_FAILURE_AUDIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_NO_ALLOC_STRINGS => 4
}
