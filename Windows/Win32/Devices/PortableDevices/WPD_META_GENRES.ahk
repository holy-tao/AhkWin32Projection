#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_META\_GENRES enumeration type describes a broad genre type of a media file.
 * @remarks
 * This enumeration is used by the [WPD\_MEDIA\_META\_GENRE](media-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-meta-genres
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_META_GENRES extends Win32Enum {

    /**
     * Native name: WPD_META_GENRE_UNUSED
     * @type {Integer (Int32)}
     */
    static GENRE_UNUSED => 0

    /**
     * Native name: WPD_META_GENRE_GENERIC_MUSIC_AUDIO_FILE
     * @type {Integer (Int32)}
     */
    static GENRE_GENERIC_MUSIC_AUDIO_FILE => 1

    /**
     * Native name: WPD_META_GENRE_GENERIC_NON_MUSIC_AUDIO_FILE
     * @type {Integer (Int32)}
     */
    static GENRE_GENERIC_NON_MUSIC_AUDIO_FILE => 17

    /**
     * Native name: WPD_META_GENRE_SPOKEN_WORD_AUDIO_BOOK_FILES
     * @type {Integer (Int32)}
     */
    static GENRE_SPOKEN_WORD_AUDIO_BOOK_FILES => 18

    /**
     * Native name: WPD_META_GENRE_SPOKEN_WORD_FILES_NON_AUDIO_BOOK
     * @type {Integer (Int32)}
     */
    static GENRE_SPOKEN_WORD_FILES_NON_AUDIO_BOOK => 19

    /**
     * Native name: WPD_META_GENRE_SPOKEN_WORD_NEWS
     * @type {Integer (Int32)}
     */
    static GENRE_SPOKEN_WORD_NEWS => 20

    /**
     * Native name: WPD_META_GENRE_SPOKEN_WORD_TALK_SHOWS
     * @type {Integer (Int32)}
     */
    static GENRE_SPOKEN_WORD_TALK_SHOWS => 21

    /**
     * Native name: WPD_META_GENRE_GENERIC_VIDEO_FILE
     * @type {Integer (Int32)}
     */
    static GENRE_GENERIC_VIDEO_FILE => 33

    /**
     * Native name: WPD_META_GENRE_NEWS_VIDEO_FILE
     * @type {Integer (Int32)}
     */
    static GENRE_NEWS_VIDEO_FILE => 34

    /**
     * Native name: WPD_META_GENRE_MUSIC_VIDEO_FILE
     * @type {Integer (Int32)}
     */
    static GENRE_MUSIC_VIDEO_FILE => 35

    /**
     * Native name: WPD_META_GENRE_HOME_VIDEO_FILE
     * @type {Integer (Int32)}
     */
    static GENRE_HOME_VIDEO_FILE => 36

    /**
     * Native name: WPD_META_GENRE_FEATURE_FILM_VIDEO_FILE
     * @type {Integer (Int32)}
     */
    static GENRE_FEATURE_FILM_VIDEO_FILE => 37

    /**
     * Native name: WPD_META_GENRE_TELEVISION_VIDEO_FILE
     * @type {Integer (Int32)}
     */
    static GENRE_TELEVISION_VIDEO_FILE => 38

    /**
     * Native name: WPD_META_GENRE_TRAINING_EDUCATIONAL_VIDEO_FILE
     * @type {Integer (Int32)}
     */
    static GENRE_TRAINING_EDUCATIONAL_VIDEO_FILE => 39

    /**
     * Native name: WPD_META_GENRE_PHOTO_MONTAGE_VIDEO_FILE
     * @type {Integer (Int32)}
     */
    static GENRE_PHOTO_MONTAGE_VIDEO_FILE => 40

    /**
     * Native name: WPD_META_GENRE_GENERIC_NON_AUDIO_NON_VIDEO
     * @type {Integer (Int32)}
     */
    static GENRE_GENERIC_NON_AUDIO_NON_VIDEO => 48

    /**
     * Native name: WPD_META_GENRE_AUDIO_PODCAST
     * @type {Integer (Int32)}
     */
    static GENRE_AUDIO_PODCAST => 64

    /**
     * Native name: WPD_META_GENRE_VIDEO_PODCAST
     * @type {Integer (Int32)}
     */
    static GENRE_VIDEO_PODCAST => 65

    /**
     * Native name: WPD_META_GENRE_MIXED_PODCAST
     * @type {Integer (Int32)}
     */
    static GENRE_MIXED_PODCAST => 66
}
