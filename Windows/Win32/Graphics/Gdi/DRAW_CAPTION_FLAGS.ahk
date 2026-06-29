#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DRAW_CAPTION_FLAGS {
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
    static DC_ACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DC_BUTTONS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DC_GRADIENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DC_ICON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DC_INBUTTON => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DC_SMALLCAP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DC_TEXT => 8
}
