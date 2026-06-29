#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct FEEDS_SYNC_SETTING {
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
    static FSS_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static FSS_INTERVAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static FSS_MANUAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static FSS_SUGGESTED => 3
}
