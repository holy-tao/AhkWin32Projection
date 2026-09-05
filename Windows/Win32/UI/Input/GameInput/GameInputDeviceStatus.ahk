#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputDeviceStatus extends Win32BitflagEnum {

    /**
     * Native name: GameInputDeviceNoStatus
     * @type {Integer (Int32)}
     */
    static NoStatus => 0

    /**
     * Native name: GameInputDeviceConnected
     * @type {Integer (Int32)}
     */
    static Connected => 1

    /**
     * Native name: GameInputDeviceInputEnabled
     * @type {Integer (Int32)}
     */
    static InputEnabled => 2

    /**
     * Native name: GameInputDeviceOutputEnabled
     * @type {Integer (Int32)}
     */
    static OutputEnabled => 4

    /**
     * Native name: GameInputDeviceRawIoEnabled
     * @type {Integer (Int32)}
     */
    static RawIoEnabled => 8

    /**
     * Native name: GameInputDeviceAudioCapture
     * @type {Integer (Int32)}
     */
    static AudioCapture => 16

    /**
     * Native name: GameInputDeviceAudioRender
     * @type {Integer (Int32)}
     */
    static AudioRender => 32

    /**
     * Native name: GameInputDeviceSynchronized
     * @type {Integer (Int32)}
     */
    static Synchronized => 64

    /**
     * Native name: GameInputDeviceWireless
     * @type {Integer (Int32)}
     */
    static Wireless => 128

    /**
     * Native name: GameInputDeviceUserIdle
     * @type {Integer (Int32)}
     */
    static UserIdle => 1048576

    /**
     * Native name: GameInputDeviceAnyStatus
     * @type {Integer (Int32)}
     */
    static AnyStatus => 16777215
}
