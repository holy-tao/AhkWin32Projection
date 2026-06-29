#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct NLA_BLOB_DATA_TYPE {
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
    static NLA_RAW_DATA => 0

    /**
     * @type {Integer (Int32)}
     */
    static NLA_INTERFACE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NLA_802_1X_LOCATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static NLA_CONNECTIVITY => 3

    /**
     * @type {Integer (Int32)}
     */
    static NLA_ICS => 4
}
