#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media
 */
export default struct TIMECODE_SAMPLE_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static ED_DEVCAP_TIMECODE_READ => 4121

    /**
     * @type {Integer (UInt32)}
     */
    static ED_DEVCAP_ATN_READ => 5047

    /**
     * @type {Integer (UInt32)}
     */
    static ED_DEVCAP_RTC_READ => 5050
}
