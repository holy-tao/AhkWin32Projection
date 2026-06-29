#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IP_OPTION_TIMESTAMP_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static IP_OPTION_TIMESTAMP_ONLY => 0

    /**
     * @type {Integer (Int32)}
     */
    static IP_OPTION_TIMESTAMP_ADDRESS => 1

    /**
     * @type {Integer (Int32)}
     */
    static IP_OPTION_TIMESTAMP_SPECIFIC_ADDRESS => 3
}
