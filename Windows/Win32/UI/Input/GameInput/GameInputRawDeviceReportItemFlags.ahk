#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputRawDeviceReportItemFlags {
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
    static GameInputDefaultItem => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputConstantItem => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArrayItem => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputRelativeItem => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputWraparoundItem => 8

    /**
     * @type {Integer (Int32)}
     */
    static GameInputNonlinearItem => 16

    /**
     * @type {Integer (Int32)}
     */
    static GameInputStableItem => 32

    /**
     * @type {Integer (Int32)}
     */
    static GameInputNullableItem => 64

    /**
     * @type {Integer (Int32)}
     */
    static GameInputVolatileItem => 128

    /**
     * @type {Integer (Int32)}
     */
    static GameInputBufferedItem => 256
}
