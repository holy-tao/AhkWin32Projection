#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct GDI_REGION_TYPE {
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
    static RGN_ERROR => 0

    /**
     * @type {Integer (Int32)}
     */
    static NULLREGION => 1

    /**
     * @type {Integer (Int32)}
     */
    static SIMPLEREGION => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMPLEXREGION => 3
}
