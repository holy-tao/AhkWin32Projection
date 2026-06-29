#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct SOUNDSENTRY_TEXT_EFFECT {
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
    static SSTF_BORDER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SSTF_CHARS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SSTF_DISPLAY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SSTF_NONE => 0
}
