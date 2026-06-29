#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct AudioSessionDisconnectReason {
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
    static DisconnectReasonDeviceRemoval => 0

    /**
     * @type {Integer (Int32)}
     */
    static DisconnectReasonServerShutdown => 1

    /**
     * @type {Integer (Int32)}
     */
    static DisconnectReasonFormatChanged => 2

    /**
     * @type {Integer (Int32)}
     */
    static DisconnectReasonSessionLogoff => 3

    /**
     * @type {Integer (Int32)}
     */
    static DisconnectReasonSessionDisconnected => 4

    /**
     * @type {Integer (Int32)}
     */
    static DisconnectReasonExclusiveModeOverride => 5
}
