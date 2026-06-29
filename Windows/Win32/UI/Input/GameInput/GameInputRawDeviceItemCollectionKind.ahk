#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputRawDeviceItemCollectionKind {
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
    static GameInputUnknownItemCollection => -1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalItemCollection => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputApplicationItemCollection => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLogicalItemCollection => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputReportItemCollection => 3

    /**
     * @type {Integer (Int32)}
     */
    static GameInputNamedArrayItemCollection => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUsageSwitchItemCollection => 5

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUsageModifierItemCollection => 6
}
