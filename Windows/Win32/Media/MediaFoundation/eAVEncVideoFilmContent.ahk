#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether the original source of the input video was film or video. This enumeration is used with the AVEncVideoSourceFilmContent property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideofilmcontent
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncVideoFilmContent extends Win32Enum{

    /**
     * The original source was video.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoFilmContent_VideoOnly => 0

    /**
     * The original source was film.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoFilmContent_FilmOnly => 1

    /**
     * The original source contains a mix of video and film.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoFilmContent_Mixed => 2
}
