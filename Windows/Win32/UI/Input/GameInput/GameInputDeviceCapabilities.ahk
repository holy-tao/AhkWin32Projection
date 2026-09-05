#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputDeviceCapabilities extends Win32BitflagEnum {

    /**
     * Native name: GameInputDeviceCapabilityNone
     * @type {Integer (Int32)}
     */
    static CapabilityNone => 0

    /**
     * Native name: GameInputDeviceCapabilityAudio
     * @type {Integer (Int32)}
     */
    static CapabilityAudio => 1

    /**
     * Native name: GameInputDeviceCapabilityPluginModule
     * @type {Integer (Int32)}
     */
    static CapabilityPluginModule => 2

    /**
     * Native name: GameInputDeviceCapabilityPowerOff
     * @type {Integer (Int32)}
     */
    static CapabilityPowerOff => 4

    /**
     * Native name: GameInputDeviceCapabilitySynchronization
     * @type {Integer (Int32)}
     */
    static CapabilitySynchronization => 8

    /**
     * Native name: GameInputDeviceCapabilityWireless
     * @type {Integer (Int32)}
     */
    static CapabilityWireless => 16
}
