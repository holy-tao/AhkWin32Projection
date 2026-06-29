#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AMPlayListEventFlags {
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
    static AMPLAYLISTEVENT_RESUME => 0

    /**
     * @type {Integer (Int32)}
     */
    static AMPLAYLISTEVENT_BREAK => 1

    /**
     * @type {Integer (Int32)}
     */
    static AMPLAYLISTEVENT_NEXT => 2

    /**
     * @type {Integer (Int32)}
     */
    static AMPLAYLISTEVENT_MASK => 15

    /**
     * @type {Integer (Int32)}
     */
    static AMPLAYLISTEVENT_REFRESH => 16
}
