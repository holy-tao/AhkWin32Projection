#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 */
class AudioSessionDisconnectReason extends Win32Enum {

    /**
     * Native name: DisconnectReasonDeviceRemoval
     * @type {Integer (Int32)}
     */
    static DeviceRemoval => 0

    /**
     * Native name: DisconnectReasonServerShutdown
     * @type {Integer (Int32)}
     */
    static ServerShutdown => 1

    /**
     * Native name: DisconnectReasonFormatChanged
     * @type {Integer (Int32)}
     */
    static FormatChanged => 2

    /**
     * Native name: DisconnectReasonSessionLogoff
     * @type {Integer (Int32)}
     */
    static SessionLogoff => 3

    /**
     * Native name: DisconnectReasonSessionDisconnected
     * @type {Integer (Int32)}
     */
    static SessionDisconnected => 4

    /**
     * Native name: DisconnectReasonExclusiveModeOverride
     * @type {Integer (Int32)}
     */
    static ExclusiveModeOverride => 5
}
