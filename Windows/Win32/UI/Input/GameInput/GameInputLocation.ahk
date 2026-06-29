#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputLocation {
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
    static GameInputLocationUnknown => -1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLocationChassis => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLocationDisplay => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLocationAxis => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLocationButton => 3

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLocationSwitch => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLocationKey => 5

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLocationTouchPad => 6
}
