#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct STRETCH_BLT_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static BLACKONWHITE => 1

    /**
     * @type {Integer (Int32)}
     */
    static COLORONCOLOR => 3

    /**
     * @type {Integer (Int32)}
     */
    static HALFTONE => 4

    /**
     * @type {Integer (Int32)}
     */
    static STRETCH_ANDSCANS => 1

    /**
     * @type {Integer (Int32)}
     */
    static STRETCH_DELETESCANS => 3

    /**
     * @type {Integer (Int32)}
     */
    static STRETCH_HALFTONE => 4

    /**
     * @type {Integer (Int32)}
     */
    static STRETCH_ORSCANS => 2

    /**
     * @type {Integer (Int32)}
     */
    static WHITEONBLACK => 2
}
