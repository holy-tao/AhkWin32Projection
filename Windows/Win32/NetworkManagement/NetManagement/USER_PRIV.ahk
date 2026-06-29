#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_PRIV {
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
    static USER_PRIV_GUEST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USER_PRIV_USER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USER_PRIV_ADMIN => 2
}
