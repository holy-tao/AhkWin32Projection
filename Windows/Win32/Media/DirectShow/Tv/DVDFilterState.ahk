#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct DVDFilterState {
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
    static dvdState_Undefined => -2

    /**
     * @type {Integer (Int32)}
     */
    static dvdState_Unitialized => -1

    /**
     * @type {Integer (Int32)}
     */
    static dvdState_Stopped => 0

    /**
     * @type {Integer (Int32)}
     */
    static dvdState_Paused => 1

    /**
     * @type {Integer (Int32)}
     */
    static dvdState_Running => 2
}
