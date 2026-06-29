#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This topic applies to Windows XP or later.
 * @see https://learn.microsoft.com/windows/win32/api/msvidctl/ne-msvidctl-msvidctlstatelist
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MSVidCtlStateList {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that there is no filter graph.
     * @type {Integer (Int32)}
     */
    static STATE_UNBUILT => -1

    /**
     * Indicates that the Video Control is stopped.
     * @type {Integer (Int32)}
     */
    static STATE_STOP => 0

    /**
     * Indicates that the Video Control is paused.
     * @type {Integer (Int32)}
     */
    static STATE_PAUSE => 1

    /**
     * Indicates that the Video Control is playing.
     * @type {Integer (Int32)}
     */
    static STATE_PLAY => 2
}
