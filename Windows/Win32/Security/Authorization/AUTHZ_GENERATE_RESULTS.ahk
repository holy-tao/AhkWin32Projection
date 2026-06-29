#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_GENERATE_RESULTS {
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
    static AUTHZ_GENERATE_SUCCESS_AUDIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_GENERATE_FAILURE_AUDIT => 2
}
