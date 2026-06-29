#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct ENUM_DISPLAY_SETTINGS_FLAGS {
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
    static EDS_RAWMODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EDS_ROTATEDMODE => 4
}
