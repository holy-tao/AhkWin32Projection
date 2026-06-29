#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MBN_ACTIVATION_STATE enumerated type indicates the current data connection state.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_activation_state
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_ACTIVATION_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
