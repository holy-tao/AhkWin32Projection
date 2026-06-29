#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct AF_OP {
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
    static AF_OP_PRINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AF_OP_COMM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AF_OP_SERVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AF_OP_ACCOUNTS => 8
}
