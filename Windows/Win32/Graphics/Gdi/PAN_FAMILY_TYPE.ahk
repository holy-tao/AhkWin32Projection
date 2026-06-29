#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct PAN_FAMILY_TYPE {
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
    static PAN_FAMILY_ANY => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static PAN_FAMILY_NO_FIT => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static PAN_FAMILY_TEXT_DISPLAY => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static PAN_FAMILY_SCRIPT => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static PAN_FAMILY_DECORATIVE => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static PAN_FAMILY_PICTORIAL => 0x05
}
