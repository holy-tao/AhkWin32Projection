#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_SIGNAL_STATE {
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
    static BDA_SIGNAL_UNAVAILABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SIGNAL_INACTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SIGNAL_ACTIVE => 2
}
