#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USE_INFO_ASG_TYPE {
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
    static USE_WILDCARD => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static USE_DISKDEV => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USE_SPOOLDEV => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USE_IPC => 3
}
