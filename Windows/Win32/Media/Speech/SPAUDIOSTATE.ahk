#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPAUDIOSTATE {
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
    static SPAS_CLOSED => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPAS_STOP => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPAS_PAUSE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPAS_RUN => 3
}
