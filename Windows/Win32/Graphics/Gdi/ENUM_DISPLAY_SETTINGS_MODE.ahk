#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct ENUM_DISPLAY_SETTINGS_MODE {
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
    static ENUM_CURRENT_SETTINGS => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_REGISTRY_SETTINGS => 4294967294
}
