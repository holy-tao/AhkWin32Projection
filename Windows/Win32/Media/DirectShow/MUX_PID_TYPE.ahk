#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct MUX_PID_TYPE {
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
    static PID_OTHER => -1

    /**
     * @type {Integer (Int32)}
     */
    static PID_ELEMENTARY_STREAM => 0

    /**
     * @type {Integer (Int32)}
     */
    static PID_MPEG2_SECTION_PSI_SI => 1
}
