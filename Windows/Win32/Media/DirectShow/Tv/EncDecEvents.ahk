#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct EncDecEvents {
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
    static ENCDEC_CPEVENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static ENCDEC_RECORDING_STATUS => 1
}
