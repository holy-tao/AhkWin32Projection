#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct TMPF_FLAGS {
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
    static TMPF_FIXED_PITCH => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static TMPF_VECTOR => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static TMPF_DEVICE => 0x08

    /**
     * @type {Integer (Byte)}
     */
    static TMPF_TRUETYPE => 0x04
}
