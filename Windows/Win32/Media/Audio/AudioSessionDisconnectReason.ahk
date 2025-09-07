#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class AudioSessionDisconnectReason{

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
