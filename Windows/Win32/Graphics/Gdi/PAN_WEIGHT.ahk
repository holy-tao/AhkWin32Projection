#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct PAN_WEIGHT {
    value : UInt8

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Byte)}
     */
    static PAN_WEIGHT_ANY => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static PAN_WEIGHT_NO_FIT => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static PAN_WEIGHT_INDEX => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static PAN_WEIGHT_VERY_LIGHT => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static PAN_WEIGHT_LIGHT => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static PAN_WEIGHT_THIN => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static PAN_WEIGHT_BOOK => 0x05

    /**
     * @type {Integer (Byte)}
     */
    static PAN_WEIGHT_MEDIUM => 0x06

    /**
     * @type {Integer (Byte)}
     */
    static PAN_WEIGHT_DEMI => 0x07

    /**
     * @type {Integer (Byte)}
     */
    static PAN_WEIGHT_BOLD => 0x08

    /**
     * @type {Integer (Byte)}
     */
    static PAN_WEIGHT_HEAVY => 0x09

    /**
     * @type {Integer (Byte)}
     */
    static PAN_WEIGHT_BLACK => 0x0A

    /**
     * @type {Integer (Byte)}
     */
    static PAN_WEIGHT_NORD => 0x0B
}
