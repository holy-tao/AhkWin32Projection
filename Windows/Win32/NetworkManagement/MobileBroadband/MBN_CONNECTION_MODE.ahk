#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MBN_CONNECTION_MODE enumerated type specifies the mode of connection requested.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_connection_mode
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_CONNECTION_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Profile name is used for connection.
     * @type {Integer (Int32)}
     */
    static MBN_CONNECTION_MODE_PROFILE => 0

    /**
     * A string representing the XML profile is used for connection.
     * @type {Integer (Int32)}
     */
    static MBN_CONNECTION_MODE_TMP_PROFILE => 1
}
