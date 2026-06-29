#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct PAN_LETT_FORM {
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
    static PAN_LETT_FORM_ANY => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static PAN_LETT_FORM_NO_FIT => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static PAN_LETT_NORMAL_CONTACT => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static PAN_LETT_NORMAL_WEIGHTED => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static PAN_LETT_NORMAL_BOXED => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static PAN_LETT_NORMAL_FLATTENED => 0x05

    /**
     * @type {Integer (Byte)}
     */
    static PAN_LETT_NORMAL_ROUNDED => 0x06

    /**
     * @type {Integer (Byte)}
     */
    static PAN_LETT_NORMAL_OFF_CENTER => 0x07

    /**
     * @type {Integer (Byte)}
     */
    static PAN_LETT_NORMAL_SQUARE => 0x08

    /**
     * @type {Integer (Byte)}
     */
    static PAN_LETT_OBLIQUE_CONTACT => 0x09

    /**
     * @type {Integer (Byte)}
     */
    static PAN_LETT_OBLIQUE_WEIGHTED => 0x0A

    /**
     * @type {Integer (Byte)}
     */
    static PAN_LETT_OBLIQUE_BOXED => 0x0B

    /**
     * @type {Integer (Byte)}
     */
    static PAN_LETT_OBLIQUE_FLATTENED => 0x0C

    /**
     * @type {Integer (Byte)}
     */
    static PAN_LETT_OBLIQUE_ROUNDED => 0x0D

    /**
     * @type {Integer (Byte)}
     */
    static PAN_LETT_OBLIQUE_OFF_CENTER => 0x0E

    /**
     * @type {Integer (Byte)}
     */
    static PAN_LETT_OBLIQUE_SQUARE => 0x0F
}
