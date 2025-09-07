#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines flags used to determine what kind of content the subpicture stream contains.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_subpicture_type
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_SUBPICTURE_TYPE{

    /**
     * The DVD does not specify the subpicture type.
     * @type {Integer (Int32)}
     */
    static DVD_SPType_NotSpecified => 0

    /**
     * The subpicture contains language-related content such as movie subtitles or other text.
     * @type {Integer (Int32)}
     */
    static DVD_SPType_Language => 1

    /**
     * The subpicture contains nonlanguage-related content such as a bouncing ball in karaoke titles.
     * @type {Integer (Int32)}
     */
    static DVD_SPType_Other => 2
}
