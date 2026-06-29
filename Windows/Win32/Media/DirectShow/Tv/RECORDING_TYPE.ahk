#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct RECORDING_TYPE {
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
    static RECORDING_TYPE_CONTENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static RECORDING_TYPE_REFERENCE => 1
}
