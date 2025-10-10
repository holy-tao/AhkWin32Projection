#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MBN_CONNECTION_MODE enumerated type specifies the mode of connection requested.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_connection_mode
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_CONNECTION_MODE{

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
