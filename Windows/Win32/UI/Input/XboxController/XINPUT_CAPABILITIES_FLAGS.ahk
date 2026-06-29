#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 */
export default struct XINPUT_CAPABILITIES_FLAGS {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_CAPS_VOICE_SUPPORTED => 4

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_CAPS_FFB_SUPPORTED => 1

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_CAPS_WIRELESS => 2

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_CAPS_PMD_SUPPORTED => 8

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_CAPS_NO_NAVIGATION => 16
}
