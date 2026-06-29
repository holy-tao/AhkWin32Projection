#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct FEEDS_EVENTS_ITEM_COUNT_FLAGS {
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
    static FEICF_READ_ITEM_COUNT_CHANGED => 1

    /**
     * @type {Integer (Int32)}
     */
    static FEICF_UNREAD_ITEM_COUNT_CHANGED => 2
}
