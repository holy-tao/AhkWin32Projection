#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct LEGACY_TOUCHPAD_FEATURES {
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
    static LEGACY_TOUCHPAD_FEATURE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static LEGACY_TOUCHPAD_FEATURE_ENABLE_DISABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static LEGACY_TOUCHPAD_FEATURE_REVERSE_SCROLL_DIRECTION => 4
}
