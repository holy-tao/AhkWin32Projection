#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct Pilot {
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
    static BDA_PILOT_NOT_SET => -1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_PILOT_NOT_DEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDA_PILOT_OFF => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_PILOT_ON => 2

    /**
     * @type {Integer (Int32)}
     */
    static BDA_PILOT_MAX => 3
}
