#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct PAN_STROKE_VARIATION {
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
    static PAN_STROKE_ANY => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static PAN_STROKE_NO_FIT => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static PAN_STROKE_GRADUAL_DIAG => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static PAN_STROKE_GRADUAL_TRAN => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static PAN_STROKE_GRADUAL_VERT => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static PAN_STROKE_GRADUAL_HORZ => 0x05

    /**
     * @type {Integer (Byte)}
     */
    static PAN_STROKE_RAPID_VERT => 0x06

    /**
     * @type {Integer (Byte)}
     */
    static PAN_STROKE_RAPID_HORZ => 0x07

    /**
     * @type {Integer (Byte)}
     */
    static PAN_STROKE_INSTANT_VERT => 0x08
}
