#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct OUTPUT_WIRE_COLOR_SPACE_TYPE {
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
    static OUTPUT_WIRE_COLOR_SPACE_G22_P709 => 0

    /**
     * @type {Integer (Int32)}
     */
    static OUTPUT_WIRE_COLOR_SPACE_RESERVED => 4

    /**
     * @type {Integer (Int32)}
     */
    static OUTPUT_WIRE_COLOR_SPACE_G2084_P2020 => 12

    /**
     * @type {Integer (Int32)}
     */
    static OUTPUT_WIRE_COLOR_SPACE_G22_P709_WCG => 30

    /**
     * @type {Integer (Int32)}
     */
    static OUTPUT_WIRE_COLOR_SPACE_G22_P2020 => 31

    /**
     * @type {Integer (Int32)}
     */
    static OUTPUT_WIRE_COLOR_SPACE_G2084_P2020_HDR10PLUS => 32

    /**
     * @type {Integer (Int32)}
     */
    static OUTPUT_WIRE_COLOR_SPACE_G2084_P2020_DVLL => 33
}
