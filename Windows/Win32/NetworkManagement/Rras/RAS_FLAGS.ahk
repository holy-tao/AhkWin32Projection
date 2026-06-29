#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RAS_FLAGS {
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
    static RAS_FLAGS_PPP_CONNECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_FLAGS_MESSENGER_PRESENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_FLAGS_QUARANTINE_PRESENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_FLAGS_ARAP_CONNECTION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_FLAGS_IKEV2_CONNECTION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_FLAGS_DORMANT => 32
}
