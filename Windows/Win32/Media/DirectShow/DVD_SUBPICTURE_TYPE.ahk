#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines flags used to determine what kind of content the subpicture stream contains.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_subpicture_type
 * @namespace Windows.Win32.Media.DirectShow
 */
class DVD_SUBPICTURE_TYPE extends Win32Enum {

    /**
     * The DVD does not specify the subpicture type.
     * Native name: DVD_SPType_NotSpecified
     * @type {Integer (Int32)}
     */
    static SPType_NotSpecified => 0

    /**
     * The subpicture contains language-related content such as movie subtitles or other text.
     * Native name: DVD_SPType_Language
     * @type {Integer (Int32)}
     */
    static SPType_Language => 1

    /**
     * The subpicture contains nonlanguage-related content such as a bouncing ball in karaoke titles.
     * Native name: DVD_SPType_Other
     * @type {Integer (Int32)}
     */
    static SPType_Other => 2
}
