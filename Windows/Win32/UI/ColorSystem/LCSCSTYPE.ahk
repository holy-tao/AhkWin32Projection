#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct LCSCSTYPE {
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
    static LCS_CALIBRATED_RGB => 0

    /**
     * @type {Integer (Int32)}
     */
    static LCS_sRGB => 1934772034

    /**
     * @type {Integer (Int32)}
     */
    static LCS_WINDOWS_COLOR_SPACE => 1466527264
}
