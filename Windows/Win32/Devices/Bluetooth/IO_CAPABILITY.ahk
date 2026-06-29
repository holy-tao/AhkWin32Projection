#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct IO_CAPABILITY {
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
    static IoCaps_DisplayOnly => 0

    /**
     * @type {Integer (Int32)}
     */
    static IoCaps_DisplayYesNo => 1

    /**
     * @type {Integer (Int32)}
     */
    static IoCaps_KeyboardOnly => 2

    /**
     * @type {Integer (Int32)}
     */
    static IoCaps_NoInputNoOutput => 3

    /**
     * @type {Integer (Int32)}
     */
    static IoCaps_Undefined => 255
}
