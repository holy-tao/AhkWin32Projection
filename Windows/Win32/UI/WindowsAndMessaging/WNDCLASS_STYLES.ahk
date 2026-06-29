#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct WNDCLASS_STYLES {
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
    static CS_VREDRAW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CS_HREDRAW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CS_DBLCLKS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CS_OWNDC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CS_CLASSDC => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CS_PARENTDC => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CS_NOCLOSE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CS_SAVEBITS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CS_BYTEALIGNCLIENT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CS_BYTEALIGNWINDOW => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CS_GLOBALCLASS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static CS_IME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CS_DROPSHADOW => 131072
}
