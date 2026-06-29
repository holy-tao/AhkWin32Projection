#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify the mechanism by which a font came to be included in a font set.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_font_source_type
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_FONT_SOURCE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies that the font source is unknown, or is not any of the other defined font source types.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_SOURCE_TYPE_UNKNOWN => 0

    /**
     * Specifies that the font source is a font file that's installed for all users on the device.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_SOURCE_TYPE_PER_MACHINE => 1

    /**
     * Specifies that the font source is a font file that's installed for the current user.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_SOURCE_TYPE_PER_USER => 2

    /**
     * Specifies that the font source is an APPX package, which includes one or more font files. The font source name is the full name of the package.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_SOURCE_TYPE_APPX_PACKAGE => 3

    /**
     * Specifies that the font source is a font provider for downloadable fonts.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_SOURCE_TYPE_REMOTE_FONT_PROVIDER => 4
}
