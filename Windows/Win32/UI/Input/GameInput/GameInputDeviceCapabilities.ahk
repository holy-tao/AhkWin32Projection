#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputDeviceCapabilities extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDeviceCapabilityNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDeviceCapabilityAudio => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDeviceCapabilityPluginModule => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDeviceCapabilityPowerOff => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDeviceCapabilitySynchronization => 8

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDeviceCapabilityWireless => 16
}
