#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 */
export default struct XINPUT_FLAG {
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
    static XINPUT_FLAG_ALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XINPUT_FLAG_GAMEPAD => 1
}
