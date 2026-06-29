#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct DTTOPTS_FLAGS {
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
    static DTT_TEXTCOLOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DTT_BORDERCOLOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DTT_SHADOWCOLOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DTT_SHADOWTYPE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DTT_SHADOWOFFSET => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DTT_BORDERSIZE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DTT_FONTPROP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DTT_COLORPROP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DTT_STATEID => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DTT_CALCRECT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DTT_APPLYOVERLAY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DTT_GLOWSIZE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DTT_CALLBACK => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DTT_COMPOSITED => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DTT_VALIDBITS => 12287
}
