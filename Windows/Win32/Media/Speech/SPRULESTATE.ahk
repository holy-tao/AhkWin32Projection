#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPRULESTATE {
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
    static SPRS_INACTIVE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPRS_ACTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPRS_ACTIVE_WITH_AUTO_PAUSE => 3

    /**
     * @type {Integer (Int32)}
     */
    static SPRS_ACTIVE_USER_DELIMITED => 4
}
