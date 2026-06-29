#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct SOUNDSENTRY_WINDOWS_EFFECT {
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
    static SSWF_CUSTOM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SSWF_DISPLAY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SSWF_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SSWF_TITLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SSWF_WINDOW => 2
}
