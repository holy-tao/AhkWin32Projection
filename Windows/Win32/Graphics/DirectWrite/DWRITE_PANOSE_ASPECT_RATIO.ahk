#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DWRITE_PANOSE_ASPECT_RATIO enumeration contains values that specify info about the ratio between width and height of the character face.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_aspect_ratio
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_PANOSE_ASPECT_RATIO {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Any aspect ratio.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ASPECT_RATIO_ANY => 0

    /**
     * No fit for aspect ratio.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ASPECT_RATIO_NO_FIT => 1

    /**
     * Very condensed aspect ratio.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ASPECT_RATIO_VERY_CONDENSED => 2

    /**
     * Condensed aspect ratio.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ASPECT_RATIO_CONDENSED => 3

    /**
     * Normal aspect ratio.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ASPECT_RATIO_NORMAL => 4

    /**
     * Expanded aspect ratio.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ASPECT_RATIO_EXPANDED => 5

    /**
     * Very expanded aspect ratio.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ASPECT_RATIO_VERY_EXPANDED => 6
}
