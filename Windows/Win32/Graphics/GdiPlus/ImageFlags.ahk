#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct ImageFlags {
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
    static ImageFlagsNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsScalable => 1

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsHasAlpha => 2

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsHasTranslucent => 4

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsPartiallyScalable => 8

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsColorSpaceRGB => 16

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsColorSpaceCMYK => 32

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsColorSpaceGRAY => 64

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsColorSpaceYCBCR => 128

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsColorSpaceYCCK => 256

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsHasRealDPI => 4096

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsHasRealPixelSize => 8192

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsReadOnly => 65536

    /**
     * @type {Integer (Int32)}
     */
    static ImageFlagsCaching => 131072
}
