#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct PAN_XHEIGHT {
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
    static PAN_XHEIGHT_ANY => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static PAN_XHEIGHT_NO_FIT => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static PAN_XHEIGHT_INDEX => 0x09

    /**
     * @type {Integer (Byte)}
     */
    static PAN_XHEIGHT_CONSTANT_SMALL => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static PAN_XHEIGHT_CONSTANT_STD => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static PAN_XHEIGHT_CONSTANT_LARGE => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static PAN_XHEIGHT_DUCKING_SMALL => 0x05

    /**
     * @type {Integer (Byte)}
     */
    static PAN_XHEIGHT_DUCKING_STD => 0x06

    /**
     * @type {Integer (Byte)}
     */
    static PAN_XHEIGHT_DUCKING_LARGE => 0x07
}
