#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_MODALS_ROLES {
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
    static UAS_ROLE_STANDALONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static UAS_ROLE_MEMBER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UAS_ROLE_BACKUP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static UAS_ROLE_PRIMARY => 3
}
