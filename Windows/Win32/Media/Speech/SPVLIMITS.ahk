#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPVLIMITS {
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
    static SPMIN_VOLUME => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPMAX_VOLUME => 100

    /**
     * @type {Integer (Int32)}
     */
    static SPMIN_RATE => -10

    /**
     * @type {Integer (Int32)}
     */
    static SPMAX_RATE => 10
}
