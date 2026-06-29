#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SideShow
 */
export default struct SIDESHOW_COLOR_TYPE {
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
    static SIDESHOW_COLOR_TYPE_COLOR => 0

    /**
     * @type {Integer (Int32)}
     */
    static SIDESHOW_COLOR_TYPE_GREYSCALE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SIDESHOW_COLOR_TYPE_BLACK_AND_WHITE => 2
}
