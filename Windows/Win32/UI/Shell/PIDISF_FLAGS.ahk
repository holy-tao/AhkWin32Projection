#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct PIDISF_FLAGS {
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
    static PIDISF_RECENTLYCHANGED => 1

    /**
     * @type {Integer (Int32)}
     */
    static PIDISF_CACHEDSTICKY => 2

    /**
     * @type {Integer (Int32)}
     */
    static PIDISF_CACHEIMAGES => 16

    /**
     * @type {Integer (Int32)}
     */
    static PIDISF_FOLLOWALLLINKS => 32
}
