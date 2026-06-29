#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPCFGNOTIFY {
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
    static SPCFGN_ADD => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPCFGN_REMOVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPCFGN_INVALIDATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPCFGN_ACTIVATE => 3

    /**
     * @type {Integer (Int32)}
     */
    static SPCFGN_DEACTIVATE => 4
}
