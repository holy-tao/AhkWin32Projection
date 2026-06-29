#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 */
export default struct XINPUT_KEYSTROKE_FLAGS {
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
    static XINPUT_KEYSTROKE_KEYDOWN => 1

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_KEYSTROKE_KEYUP => 2

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_KEYSTROKE_REPEAT => 4
}
