#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct FEEDS_XML_FILTER_FLAGS {
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
    static FXFF_ALL => 0

    /**
     * @type {Integer (Int32)}
     */
    static FXFF_UNREAD => 1

    /**
     * @type {Integer (Int32)}
     */
    static FXFF_READ => 2
}
