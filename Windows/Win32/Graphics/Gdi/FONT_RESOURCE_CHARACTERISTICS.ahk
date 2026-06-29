#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct FONT_RESOURCE_CHARACTERISTICS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static FR_PRIVATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FR_NOT_ENUM => 32
}
