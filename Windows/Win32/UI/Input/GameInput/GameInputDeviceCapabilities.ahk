#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputDeviceCapabilities {
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
