#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct ACTRL_ACCESS_ENTRY_ACCESS_FLAGS {
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
    static ACTRL_ACCESS_ALLOWED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_ACCESS_DENIED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_AUDIT_SUCCESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_AUDIT_FAILURE => 8
}
