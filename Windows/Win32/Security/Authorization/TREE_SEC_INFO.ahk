#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct TREE_SEC_INFO {
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
    static TREE_SEC_INFO_SET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TREE_SEC_INFO_RESET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TREE_SEC_INFO_RESET_KEEP_EXPLICIT => 3
}
