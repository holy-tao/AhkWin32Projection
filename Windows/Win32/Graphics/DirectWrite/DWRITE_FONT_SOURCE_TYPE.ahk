#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the mechanism by which a font came to be included in a font set.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_font_source_type
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_FONT_SOURCE_TYPE extends Win32Enum {

    /**
     * Specifies that the font source is unknown, or is not any of the other defined font source types.
     * Native name: DWRITE_FONT_SOURCE_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Specifies that the font source is a font file that's installed for all users on the device.
     * Native name: DWRITE_FONT_SOURCE_TYPE_PER_MACHINE
     * @type {Integer (Int32)}
     */
    static PER_MACHINE => 1

    /**
     * Specifies that the font source is a font file that's installed for the current user.
     * Native name: DWRITE_FONT_SOURCE_TYPE_PER_USER
     * @type {Integer (Int32)}
     */
    static PER_USER => 2

    /**
     * Specifies that the font source is an APPX package, which includes one or more font files. The font source name is the full name of the package.
     * Native name: DWRITE_FONT_SOURCE_TYPE_APPX_PACKAGE
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE => 3

    /**
     * Specifies that the font source is a font provider for downloadable fonts.
     * Native name: DWRITE_FONT_SOURCE_TYPE_REMOTE_FONT_PROVIDER
     * @type {Integer (Int32)}
     */
    static REMOTE_FONT_PROVIDER => 4
}
