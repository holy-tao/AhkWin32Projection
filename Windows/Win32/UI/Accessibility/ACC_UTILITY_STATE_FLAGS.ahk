#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ACC_UTILITY_STATE_FLAGS {
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
    static ANRUS_ON_SCREEN_KEYBOARD_ACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ANRUS_TOUCH_MODIFICATION_ACTIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ANRUS_PRIORITY_AUDIO_ACTIVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ANRUS_PRIORITY_AUDIO_ACTIVE_NODUCK => 8
}
