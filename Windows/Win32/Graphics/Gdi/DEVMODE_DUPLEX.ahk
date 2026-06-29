#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DEVMODE_DUPLEX {
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
    static DMDUP_SIMPLEX => 1

    /**
     * @type {Integer (Int16)}
     */
    static DMDUP_VERTICAL => 2

    /**
     * @type {Integer (Int16)}
     */
    static DMDUP_HORIZONTAL => 3
}
