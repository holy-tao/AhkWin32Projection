#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DEVMODE_TRUETYPE_OPTION {
    value : Int16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int16)}
     */
    static DMTT_BITMAP => 1

    /**
     * @type {Integer (Int16)}
     */
    static DMTT_DOWNLOAD => 2

    /**
     * @type {Integer (Int16)}
     */
    static DMTT_SUBDEV => 3

    /**
     * @type {Integer (Int16)}
     */
    static DMTT_DOWNLOAD_OUTLINE => 4
}
