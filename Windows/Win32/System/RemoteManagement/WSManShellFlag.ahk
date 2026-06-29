#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSManShellFlag {
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
    static WSMAN_FLAG_NO_COMPRESSION => 1

    /**
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_DELETE_SERVER_SESSION => 2

    /**
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_SERVER_BUFFERING_MODE_DROP => 4

    /**
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_SERVER_BUFFERING_MODE_BLOCK => 8

    /**
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_RECEIVE_DELAY_OUTPUT_STREAM => 16
}
