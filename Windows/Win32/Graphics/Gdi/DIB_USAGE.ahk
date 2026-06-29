#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DIB_USAGE {
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
    static DIB_RGB_COLORS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIB_PAL_COLORS => 1
}
