#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct HDC_MAP_MODE {
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
    static MM_ANISOTROPIC => 8

    /**
     * @type {Integer (Int32)}
     */
    static MM_HIENGLISH => 5

    /**
     * @type {Integer (Int32)}
     */
    static MM_HIMETRIC => 3

    /**
     * @type {Integer (Int32)}
     */
    static MM_ISOTROPIC => 7

    /**
     * @type {Integer (Int32)}
     */
    static MM_LOENGLISH => 4

    /**
     * @type {Integer (Int32)}
     */
    static MM_LOMETRIC => 2

    /**
     * @type {Integer (Int32)}
     */
    static MM_TEXT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MM_TWIPS => 6
}
