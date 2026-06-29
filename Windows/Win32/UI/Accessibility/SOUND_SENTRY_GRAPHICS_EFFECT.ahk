#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct SOUND_SENTRY_GRAPHICS_EFFECT {
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
    static SSGF_DISPLAY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SSGF_NONE => 0
}
