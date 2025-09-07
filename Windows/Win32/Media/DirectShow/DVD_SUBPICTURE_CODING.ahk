#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates what kind of content the subpicture stream contains.
 * @remarks
 * Most subpicture streams contain language-related content such as movie subtitles, but subpictures can also be used for the bouncing ball in karaoke or other non-language-related purposes.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_subpicture_coding
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_SUBPICTURE_CODING{

    /**
     * Indicates that the subpicture uses run length encoding.
     * @type {Integer (Int32)}
     */
    static DVD_SPCoding_RunLength => 0

    /**
     * Indicates that subpicture uses extended encoding.
     * @type {Integer (Int32)}
     */
    static DVD_SPCoding_Extended => 1

    /**
     * Indicates that the subpicture uses some other encoding scheme.
     * @type {Integer (Int32)}
     */
    static DVD_SPCoding_Other => 2
}
