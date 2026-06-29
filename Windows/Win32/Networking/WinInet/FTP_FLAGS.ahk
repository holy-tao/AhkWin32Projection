#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct FTP_FLAGS {
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
    static FTP_TRANSFER_TYPE_ASCII => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FTP_TRANSFER_TYPE_BINARY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FTP_TRANSFER_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_TRANSFER_ASCII => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_TRANSFER_BINARY => 2
}
