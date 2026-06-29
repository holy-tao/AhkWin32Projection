#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DEVMODE_COLLATE {
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
    static DMCOLLATE_FALSE => 0

    /**
     * @type {Integer (Int16)}
     */
    static DMCOLLATE_TRUE => 1
}
