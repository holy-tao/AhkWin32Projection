#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputDeviceFamily {
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
    static GameInputFamilyVirtual => -1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFamilyAggregate => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFamilyXboxOne => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFamilyXbox360 => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFamilyHid => 3

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFamilyI8042 => 4
}
