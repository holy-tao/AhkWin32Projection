#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct HAL_DISPLAY_BIOS_INFORMATION {
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
    static HalDisplayInt10Bios => 0

    /**
     * @type {Integer (Int32)}
     */
    static HalDisplayEmulatedBios => 1

    /**
     * @type {Integer (Int32)}
     */
    static HalDisplayNoBios => 2
}
