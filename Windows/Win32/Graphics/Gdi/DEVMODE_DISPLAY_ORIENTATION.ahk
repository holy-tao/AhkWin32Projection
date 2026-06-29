#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DEVMODE_DISPLAY_ORIENTATION {
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
    static DMDO_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DMDO_90 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMDO_180 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMDO_270 => 3
}
