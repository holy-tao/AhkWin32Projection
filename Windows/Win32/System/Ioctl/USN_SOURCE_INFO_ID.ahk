#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct USN_SOURCE_INFO_ID {
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
    static USN_SOURCE_AUXILIARY_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USN_SOURCE_DATA_MANAGEMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USN_SOURCE_REPLICATION_MANAGEMENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USN_SOURCE_CLIENT_REPLICATION_MANAGEMENT => 8
}
