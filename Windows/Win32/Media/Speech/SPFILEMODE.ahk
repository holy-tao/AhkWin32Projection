#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPFILEMODE {
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
    static SPFM_OPEN_READONLY => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPFM_OPEN_READWRITE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPFM_CREATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPFM_CREATE_ALWAYS => 3

    /**
     * @type {Integer (Int32)}
     */
    static SPFM_NUM_MODES => 4
}
