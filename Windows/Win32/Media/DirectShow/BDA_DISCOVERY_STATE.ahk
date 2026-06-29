#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_DISCOVERY_STATE {
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
    static BDA_DISCOVERY_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDA_DISCOVERY_REQUIRED => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_DISCOVERY_COMPLETE => 2
}
