#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct PRF_FLAGS {
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
    static PRF_VERIFYEXISTS => 1

    /**
     * @type {Integer (Int32)}
     */
    static PRF_TRYPROGRAMEXTENSIONS => 3

    /**
     * @type {Integer (Int32)}
     */
    static PRF_FIRSTDIRDEF => 4

    /**
     * @type {Integer (Int32)}
     */
    static PRF_DONTFINDLNK => 8

    /**
     * @type {Integer (Int32)}
     */
    static PRF_REQUIREABSOLUTE => 16
}
