#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct FONT_QUALITY {
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
    static DEFAULT_QUALITY => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static DRAFT_QUALITY => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static PROOF_QUALITY => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static NONANTIALIASED_QUALITY => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static ANTIALIASED_QUALITY => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static CLEARTYPE_QUALITY => 0x05
}
