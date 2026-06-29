#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct FONT_PITCH {
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
    static DEFAULT_PITCH => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static FIXED_PITCH => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static VARIABLE_PITCH => 0x02
}
