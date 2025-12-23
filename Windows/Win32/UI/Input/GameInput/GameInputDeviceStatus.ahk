#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputDeviceStatus extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDeviceNoStatus => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDeviceConnected => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDeviceInputEnabled => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDeviceOutputEnabled => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDeviceRawIoEnabled => 8

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDeviceAudioCapture => 16

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDeviceAudioRender => 32

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDeviceSynchronized => 64

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDeviceWireless => 128

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDeviceUserIdle => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDeviceAnyStatus => 16777215
}
