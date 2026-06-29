#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DEVMODE_COLOR {
    value : Int16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int16)}
     */
    static DMCOLOR_MONOCHROME => 1

    /**
     * @type {Integer (Int16)}
     */
    static DMCOLOR_COLOR => 2
}
