#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DRAWSTATE_FLAGS {
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
    static DST_COMPLEX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DST_TEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DST_PREFIXTEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DST_ICON => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DST_BITMAP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSS_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSS_UNION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DSS_DISABLED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DSS_MONO => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DSS_HIDEPREFIX => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DSS_PREFIXONLY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DSS_RIGHT => 32768
}
