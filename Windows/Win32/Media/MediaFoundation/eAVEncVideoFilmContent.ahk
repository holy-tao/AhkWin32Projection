#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether the original source of the input video was film or video. This enumeration is used with the AVEncVideoSourceFilmContent property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideofilmcontent
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncVideoFilmContent extends Win32Enum {

    /**
     * The original source was video.
     * Native name: eAVEncVideoFilmContent_VideoOnly
     * @type {Integer (Int32)}
     */
    static VideoOnly => 0

    /**
     * The original source was film.
     * Native name: eAVEncVideoFilmContent_FilmOnly
     * @type {Integer (Int32)}
     */
    static FilmOnly => 1

    /**
     * The original source contains a mix of video and film.
     * Native name: eAVEncVideoFilmContent_Mixed
     * @type {Integer (Int32)}
     */
    static Mixed => 2
}
