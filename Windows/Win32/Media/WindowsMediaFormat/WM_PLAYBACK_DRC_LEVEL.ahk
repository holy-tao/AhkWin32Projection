#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_PLAYBACK_DRC_LEVEL {
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
    static WM_PLAYBACK_DRC_HIGH => 0

    /**
     * @type {Integer (Int32)}
     */
    static WM_PLAYBACK_DRC_MEDIUM => 1

    /**
     * @type {Integer (Int32)}
     */
    static WM_PLAYBACK_DRC_LOW => 2
}
