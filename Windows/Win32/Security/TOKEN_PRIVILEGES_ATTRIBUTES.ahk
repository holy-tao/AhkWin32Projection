#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_PRIVILEGES_ATTRIBUTES {
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
    static SE_PRIVILEGE_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SE_PRIVILEGE_ENABLED_BY_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SE_PRIVILEGE_REMOVED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SE_PRIVILEGE_USED_FOR_ACCESS => 2147483648
}
