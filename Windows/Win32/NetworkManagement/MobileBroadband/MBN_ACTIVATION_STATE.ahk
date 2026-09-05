#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_ACTIVATION_STATE enumerated type indicates the current data connection state.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_activation_state
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_ACTIVATION_STATE extends Win32Enum {

    /**
     * The connection state is unknown.
     * Native name: MBN_ACTIVATION_STATE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The connection has been established.
     * Native name: MBN_ACTIVATION_STATE_ACTIVATED
     * @type {Integer (Int32)}
     */
    static ACTIVATED => 1

    /**
     * The device is establishing the connection.
     * Native name: MBN_ACTIVATION_STATE_ACTIVATING
     * @type {Integer (Int32)}
     */
    static ACTIVATING => 2

    /**
     * There is no connection.
     * Native name: MBN_ACTIVATION_STATE_DEACTIVATED
     * @type {Integer (Int32)}
     */
    static DEACTIVATED => 3

    /**
     * The device is in the process of disconnection.
     * Native name: MBN_ACTIVATION_STATE_DEACTIVATING
     * @type {Integer (Int32)}
     */
    static DEACTIVATING => 4
}
