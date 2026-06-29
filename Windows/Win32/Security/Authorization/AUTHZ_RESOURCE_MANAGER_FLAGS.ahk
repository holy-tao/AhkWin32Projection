#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_RESOURCE_MANAGER_FLAGS {
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
    static AUTHZ_RM_FLAG_NO_AUDIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_RM_FLAG_INITIALIZE_UNDER_IMPERSONATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_RM_FLAG_NO_CENTRAL_ACCESS_POLICIES => 4
}
