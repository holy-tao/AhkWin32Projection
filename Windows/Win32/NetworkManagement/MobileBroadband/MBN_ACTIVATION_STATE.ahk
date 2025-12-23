#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_ACTIVATION_STATE enumerated type indicates the current data connection state.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_activation_state
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_ACTIVATION_STATE extends Win32Enum{

    /**
     * The connection state is unknown.
     * @type {Integer (Int32)}
     */
    static MBN_ACTIVATION_STATE_NONE => 0

    /**
     * The connection has been established.
     * @type {Integer (Int32)}
     */
    static MBN_ACTIVATION_STATE_ACTIVATED => 1

    /**
     * The device is establishing the connection.
     * @type {Integer (Int32)}
     */
    static MBN_ACTIVATION_STATE_ACTIVATING => 2

    /**
     * There is no connection.
     * @type {Integer (Int32)}
     */
    static MBN_ACTIVATION_STATE_DEACTIVATED => 3

    /**
     * The device is in the process of disconnection.
     * @type {Integer (Int32)}
     */
    static MBN_ACTIVATION_STATE_DEACTIVATING => 4
}
