#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SideShow
 */
export default struct SIDESHOW_SCREEN_TYPE {
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
    static SIDESHOW_SCREEN_TYPE_BITMAP => 0

    /**
     * @type {Integer (Int32)}
     */
    static SIDESHOW_SCREEN_TYPE_TEXT => 1
}
