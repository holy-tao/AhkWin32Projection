#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT
 */
export default struct CASTING_CONNECTION_STATE {
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
    static CASTING_CONNECTION_STATE_DISCONNECTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_STATE_CONNECTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_STATE_RENDERING => 2

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_STATE_DISCONNECTING => 3

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_STATE_CONNECTING => 4
}
