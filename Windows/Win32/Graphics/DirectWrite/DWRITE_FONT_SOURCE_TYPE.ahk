#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify the mechanism by which a font came to be included in a font set.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/ne-dwrite_3-dwrite_font_source_type
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_FONT_SOURCE_TYPE{

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
