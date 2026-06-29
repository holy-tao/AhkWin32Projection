#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DISPLAYCONFIG_ADVANCED_COLOR_MODE {
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
    static DISPLAYCONFIG_ADVANCED_COLOR_MODE_SDR => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_ADVANCED_COLOR_MODE_WCG => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_ADVANCED_COLOR_MODE_HDR => 2
}
