#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPRECOSTATE {
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
    static SPRST_INACTIVE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPRST_ACTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPRST_ACTIVE_ALWAYS => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPRST_INACTIVE_WITH_PURGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static SPRST_NUM_STATES => 4
}
